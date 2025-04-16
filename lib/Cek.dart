import 'package:flutter/material.dart';

class Cek extends StatelessWidget {
  final int uangSaku;
  final String selectedCity;
  final List<String> selectedCategories;
  final Map<String, int> tambahanPengeluaran;

  Cek({
    required this.uangSaku,
    required this.selectedCity,
    required this.selectedCategories,
    required this.tambahanPengeluaran,
  });

  // UMR per kota
  final Map<String, int> umrPerCity = {
    "Surabaya": 4700000,
    "Malang": 3300000,
    "Sidoarjo": 4300000,
    "Gresik": 4300000,
    "Banyuwangi": 2500000,
  };

  // Pembobotan kategori pengeluaran
  final Map<String, double> pembagianBudget = {
    "Makan": 0.3,
    "Tempat Tinggal": 0.25,
    "Internet": 0.1,
    "Hiburan": 0.15,
    "Dana Darurat": 0.2,
  };

  @override
  Widget build(BuildContext context) {
    int umr = umrPerCity[selectedCity] ?? 3500000;

    // Total bobot yang dipakai (agar proporsi sesuai yang dipilih saja)
    double totalBobot = selectedCategories
        .map((kategori) => pembagianBudget[kategori] ?? 0)
        .fold(0, (a, b) => a + b);

    // Hitung budget untuk setiap kategori
    Map<String, int> calculatedBudget = {};
    for (String kategori in pembagianBudget.keys) {
      if (selectedCategories.contains(kategori)) {
        double proporsi = (pembagianBudget[kategori]! / totalBobot);
        calculatedBudget["Budget $kategori Perbulan"] =
            (uangSaku * proporsi).floor();
      } else {
        calculatedBudget["Budget $kategori Perbulan"] = 0;
      }
    }

    // Tambahkan pengeluaran lainnya
    tambahanPengeluaran.forEach((nama, nominal) {
      calculatedBudget[nama] = nominal;
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 105, 147, 245),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title:
            Text("Rekomendasi Anggaran", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Menambahkan padding di body
        child: Column(
          children: [
            SizedBox(height: 20),

            // Tampilkan anggaran
            Expanded(
              child: ListView(
                children: calculatedBudget.entries
                    .map((entry) =>
                        BudgetCard(title: entry.key, amount: entry.value))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BudgetCard extends StatelessWidget {
  final String title;
  final int amount;

  BudgetCard({required this.title, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 105, 147, 245),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                "Rp ${amount.toString()}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
