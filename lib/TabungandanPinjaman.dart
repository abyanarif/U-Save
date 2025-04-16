import 'package:flutter/material.dart';
import 'package:aplikasi2/Literasi.dart';

class TabungandanPinjaman extends StatelessWidget {
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
                          'Tabungan dan Pinjaman',
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
A. Tabungan 
Menabung merupakan kebiasaan finansial yang sangat penting untuk keadaan darurat dan untuk mencapai sebuah tujuan finansial di masa depan.
Tips Menabung 
  1. Tetapkan tujuan menabung
  2. Buat anggaran bulanan
  3. Mulai dari jumlah kecil
  4. Kurangi perilaku konsumtif

B. Bunga Tabungan dan Pinjaman
  1. Memahami bunga tabungan dan pinjaman
    Bunga Tabungan (Keuntungan untuk nasabah) 
    B = 100/b ​× t × M
    Total tabungan setelah bunga : 
    T = M + B 
    Keterangan : 
    b = suku bunga (persentase)
    t = periode waktu (bulan) 
    M = tabungan awal

  2. Bunga Pinjaman (Keuntungan untuk pihak yang memberikan pinjaman)
    B = 100/b ​× t × M 
    Total yang harus dibayar:
    𝑇 = 𝐻 + 𝐵
    Angsuran per bulan:
    𝐴 = 𝑇 / 𝑡
    ​b = suku bunga (persentase)
    t = periode waktu (bulan) 
    M = tabungan awal

C. Jenis Produk Perbankan
  1. Tabungan : penyimpanan dan akumulasi dana di rekening tabungan
  2.  Kredit : peminjaman uang 
  3. Deposito : simpanan yang penarikannya hanya dapat dilakukan pada waktu dan syarat tertentu
  4. Giro : simpanan yang dapat diambil kapan saja melalui warket cek dan bilyet giro 
  5. Pemindahan atau transfer uang antar rekening
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
