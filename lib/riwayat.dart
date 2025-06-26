import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'budgetCard.dart';

class RiwayatTerakhir extends StatefulWidget {
  const RiwayatTerakhir({super.key});

  @override
  State<RiwayatTerakhir> createState() => _RiwayatTerakhirState();
}

class _RiwayatTerakhirState extends State<RiwayatTerakhir> {
  User? currentUser;
  Map<String, int> latestBudget = {};
  String? city;
  int? uangSaku;
  bool isLoading = true;
  final formatter = NumberFormat.decimalPattern('id');

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
      loadLatestBudget();
    }
  }

  Future<void> loadLatestBudget() async {
    setState(() => isLoading = true);
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .collection('budget_saku')
          .orderBy('createdAt', descending: true)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final data = snapshot.docs.first.data();

        Map<String, int> tempBudget = {};

        data.forEach((key, value) {
          if (key == 'city' && value is String) {
            city = value;
          } else if (key == 'uangSaku' && (value is int || value is double)) {
            uangSaku = value is int ? value : (value as double).toInt();
          } else if (key != 'createdAt') {
            if (value is int) {
              tempBudget[key] = value;
            } else if (value is double) {
              tempBudget[key] = value.toInt();
            }
          }
        });

        latestBudget = tempBudget;
      } else {
        latestBudget = {};
        city = null;
        uangSaku = null;
      }
    } catch (e) {
      print('Gagal ambil data budget: $e');
      latestBudget = {};
      city = null;
      uangSaku = null;
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riwayat Anggaran Terakhir"),
        backgroundColor: const Color.fromARGB(255, 105, 147, 245),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : latestBudget.isEmpty
              ? const Center(child: Text("Belum ada data yang tersimpan."))
              : Padding(
                  padding: const EdgeInsets.all(16),
                  child: ListView(
                    children: [
                      if (city != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            "Kota: $city",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      if (uangSaku != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Text(
                            "Uang Saku: Rp ${formatter.format(uangSaku)}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ...latestBudget.entries.map(
                        (entry) => BudgetCard(
                          title: entry.key,
                          amount: entry.value,
                          formatter: formatter,
                          selectedCity: '$city',
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
