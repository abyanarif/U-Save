import 'package:flutter/material.dart';
import 'package:aplikasi2/Literasi.dart';

class Investasi extends StatelessWidget {
  const Investasi({super.key});

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
                          'Investasi',
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
A. Investasi : Tindakan untuk mengalokasikan sejumlah sumber daya seperti uang, waktu, usaha ke dalam suatu aset atau proyek dengan harapan untuk mendapat keuntungan di masa depan.

B. Tujuan
    1. Peningkatan nilai aset seiring waktu
    2. Pendapatan pasif
    3. Realisasi impian finansial
    4. Mengelola risiko keuangan

C. Jenis
    1. Saham (kepemilikan)
    2. Obligasi (surat utang)
    3. Reksa dana (beberapa investor)
    4. Real estat (rumah, tanah)
    5. komoditas (minyak, emas)
    6. Forex (Mata uang asing)
    7. Bisnis Startup
 
D. Manajemen Risiko 
    1. Tetapkan target
    2. Diversifikasi Portofolio 
    3. DCA (berkala)
    4. Waspada penipuan
    5. Pengetahuan dan riset 
    6. Gunakan stop loss (turun=jual)

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
