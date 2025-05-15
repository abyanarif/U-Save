import 'package:flutter/material.dart';
import 'package:aplikasi2/Literasi.dart';

class Perencanaan_Keuangan extends StatelessWidget {
  const Perencanaan_Keuangan({super.key});

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
                          'Perencanaan Keuangan',
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
A. Tujuan 
  1. Mencapai Kemandirian Finansial
  2. Persiapan Masa Pensiun
  3. Pembelian Aset Besar
  4. Menghadapi Hal Tak Terduga

B. Langkah-langkah 
  1. Hitung dan Catat Pendapatan
  2. Buat Anggaran Belanja
  3. Tentukan Prioritas Keuangan
  4. Catat Pengeluaran
  5. Siapkan Dana Darurat
  6. Pisahkan Tabungan dan Dana Investasi
  7. Sisihkan Dana Asuransi
  8. Metode 3 Pos (50% kebutuhan pokok, 20% tabungan, 30% gaya hidup)

C. Dana Darurat
Simpanan yang digunakan untuk kebutuhan tidak terduga di masa depan. 
Ideal minimum dana darurat : belum menikah (3-4 kali pengeluaran bulanan)
Mempersiapkan dana darurat 
  1. Hitung Kebutuhan Bulanan
  2. Mulai dari Jumlah Kecil
  3. Otomatisasi Penyimpanan
  4. Manfaatkan Pendapatan Tambahan
  5. Kurangi Perilaku Konsumtif 

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
