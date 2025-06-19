import 'package:aplikasi2/home_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'budgetCard.dart';

class Cek extends StatefulWidget {
  final int uangSaku;
  final String selectedCity;
  final List<String> selectedCategories;
  final Map<String, int> tambahanPengeluaran;

  const Cek({
    Key? key,
    required this.uangSaku,
    required this.selectedCity,
    required this.selectedCategories,
    required this.tambahanPengeluaran,
  }) : super(key: key);

  @override
  State<Cek> createState() => _CekState();
}

class _CekState extends State<Cek> {
  Map<String, int> umrPerCity = {};
  bool isLoading = true;
  Map<String, int>? savedBudgetFromFirestore;
  int hargaKos = 0;
  int hargaMakanan = 0;

  final Map<String, double> pembagianBudget = {
    "Makan": 0.3,
    "Tempat Tinggal": 0.25,
    "Internet": 0.1,
    "Hiburan": 0.15,
    "Dana Darurat": 0.2,
  };

  final formatter = NumberFormat.decimalPattern('id');
  User? currentUser;

  @override
  void initState() {
    super.initState();
    currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User belum login!')),
        );
        Navigator.pop(context);
      });
    } else {
      loadUmrAndBudget();
    }
  }

  Future<void> loadUmrAndBudget() async {
    setState(() => isLoading = true);
    try {
      QuerySnapshot kotaSnapshot = await FirebaseFirestore.instance
          .collection('kota')
          .where('nama', isEqualTo: widget.selectedCity)
          .limit(1)
          .get();

      Map<String, int> dataUmr = {};
      if (kotaSnapshot.docs.isNotEmpty) {
        final data = kotaSnapshot.docs.first.data() as Map<String, dynamic>;
        final umrValue = data['umr'];
        final kosValue = data['hargaKos'];
        final makanValue = data['hargaMakanan'];

        if (umrValue is int || umrValue is double) {
          dataUmr[widget.selectedCity] = (umrValue as num).toInt();
        } else {
          dataUmr[widget.selectedCity] = 0;
        }

        hargaKos = (kosValue as num?)?.toInt() ?? 0;
        hargaMakanan = (makanValue as num?)?.toInt() ?? 0;
      } else {
        dataUmr[widget.selectedCity] = 0;
        hargaKos = 0;
        hargaMakanan = 0;
      }
      umrPerCity = dataUmr;

      QuerySnapshot budgetSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .collection('budget_saku')
          .where('city', isEqualTo: widget.selectedCity)
          .where('uangSaku', isEqualTo: widget.uangSaku)
          .limit(1)
          .get();

      if (budgetSnapshot.docs.isNotEmpty) {
        var docData = budgetSnapshot.docs.first.data() as Map<String, dynamic>;
        Map<String, int> savedBudget = {};
        docData.forEach((key, value) {
          if (key != 'city' && key != 'uangSaku' && key != 'createdAt') {
            if (value is int) {
              savedBudget[key] = value;
            } else if (value is double) {
              savedBudget[key] = value.toInt();
            }
          }
        });
        savedBudgetFromFirestore = savedBudget;
      } else {
        savedBudgetFromFirestore = null;
      }
    } catch (e) {
      print('Error loading data: $e');
      savedBudgetFromFirestore = null;
    }
    setState(() => isLoading = false);
  }

  Future<void> saveBudget(Map<String, int> budgetToSave) async {
    try {
      final userDoc =
          FirebaseFirestore.instance.collection('users').doc(currentUser!.uid);
      await userDoc.collection('budget_saku').add({
        'city': widget.selectedCity,
        'uangSaku': widget.uangSaku,
        'createdAt': FieldValue.serverTimestamp(),
        ...budgetToSave,
      });
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data berhasil disimpan!')));
    } catch (e) {
      print('Error saving budget: $e');
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Gagal menyimpan data!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text('Rekomendasi Anggaran')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    int umr = umrPerCity[widget.selectedCity] ?? 3500000;
    double rasioUangSakuTerhadapUMR = widget.uangSaku / umr;
    bool diBawahUMR = rasioUangSakuTerhadapUMR < 1.0;

    double totalBobot = widget.selectedCategories
        .map((kategori) => pembagianBudget[kategori] ?? 0)
        .fold(0, (a, b) => a + b);

    Map<String, int> calculatedBudget = {};
    double penyesuaian = diBawahUMR ? rasioUangSakuTerhadapUMR : 1.0;

    for (String kategori in pembagianBudget.keys) {
      if (widget.selectedCategories.contains(kategori)) {
        double proporsi = pembagianBudget[kategori]! / totalBobot;
        int nilai = (widget.uangSaku * proporsi * penyesuaian).floor();

        // Pastikan nilai minimal berdasarkan harga kos dan makanan
        if (kategori == "Tempat Tinggal" && hargaKos > 0) {
          if (nilai < hargaKos) nilai = hargaKos;
        }
        if (kategori == "Makan" && hargaMakanan > 0) {
          if (nilai < hargaMakanan) nilai = hargaMakanan;
        }

        calculatedBudget["Budget $kategori Perbulan"] = nilai;
      } else {
        calculatedBudget["Budget $kategori Perbulan"] = 0;
      }
    }

    // Tambahkan pengeluaran tambahan yang dipilih user
    widget.tambahanPengeluaran.forEach((nama, nominal) {
      calculatedBudget[nama] = nominal;
    });

    Map<String, int> budgetToShow =
        savedBudgetFromFirestore ?? calculatedBudget;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 105, 147, 245),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Rekomendasi Anggaran",
            style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.save, color: Colors.white),
            tooltip: "Simpan Data Budget",
            onPressed: () async {
              await saveBudget(budgetToShow);
            },
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            child: const Text(
              'Keluar',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (diBawahUMR)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  '⚠ Uang saku Anda di bawah UMR ${widget.selectedCity}.\nDisarankan untuk menyesuaikan pengeluaran.',
                  style: const TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: budgetToShow.entries
                    .map((entry) => BudgetCard(
                          title: entry.key,
                          amount: entry.value,
                          formatter: formatter,
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
