import 'package:flutter/material.dart';
import 'package:aplikasi2/Literasi.dart';

class Pemahaman_Dasar extends StatelessWidget {
  const Pemahaman_Dasar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6993F5),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, size: 30, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => Literasi()),
                    );
                  },
                ),
              ],
            ),
            Center(
              child: Text(
                'LITERASI KEUANGAN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: Offset(4, 4),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          'Pemahaman Dasar Keuangan Pribadi',
                          style: TextStyle(
                            color: Color(0xFF6993F5),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '''
A. Konsep Dasar Keuangan :
    1. Aset → semua sumber daya ekonomi yang dimiliki seseorang dan memberikan manfaat di masa depan. Aset harus seimbang dengan total kewajiban dan ekuitas. Aset = kewajiban (utang) + ekuitas.

    2. Utang → kewajiban finansial yang harus dibayarkan kepada pihak peminjam.

    3. Ekuitas → modal pemilik, mencakup laba atau kerugian yang dihasilkan.

    4. Pendapatan → semua penerimaan yang diperoleh.

    5. Biaya → pengeluaran yang dikeluarkan untuk berbagai kebutuhan.

B. Pengelolaan Anggaran :
Buat anggaran untuk memantau pemasukan dan pengeluaran serta memastikan pengeluaran tidak lebih besar daripada pemasukan.
1. Hitung Pendapatan.
2. List Kebutuhan Bulanan.
3. Prioritaskan Kebutuhan Utama.
4. Persiapkan Tabungan, Investasi, dan Dana Darurat.
5. Kelola Hutang/Kredit dengan Bijak.
6. Evaluasi Anggaran Secara Berkala.
                        ''',
                        style: TextStyle(
                          fontSize: 21,
                          height: 1.6,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
