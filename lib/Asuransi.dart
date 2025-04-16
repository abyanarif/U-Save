import 'package:flutter/material.dart';
import 'package:aplikasi2/Literasi.dart';

class Asuransi extends StatelessWidget {
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
                          'Asuransi',
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
A. Fungsi
  Melindungi kehidupan, aset, dan memberikan keamanan finansial jangka panjang dalam menghadapi kejadian tak terduga seperti kecelakaan atau penyakit berat 

B. Jenis 
  1. Kesehatan 
  2. Jiwa
  3. Kendaraan
  4. Pensiun

C. Manfaat 
  1. Perlindungan finansial
  2. Akses Layanan Kesehatan
  3. Persiapan Masa Depan

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
