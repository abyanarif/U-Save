import 'package:flutter/material.dart';

class MutasiTransaksi extends StatelessWidget {
  const MutasiTransaksi({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Pemasukan")),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(onPressed: () {}, child: Text("Pengeluaran"))
              ],
            ),
          ),
        ),
        const SizedBox(height: 20), // Jarak antara tombol dan teks
        const Column(
          children: [
            Text(
              'Mutasi Transaksi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Rp 0',
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
          ],
        ),
      ],
    );
  }
}
