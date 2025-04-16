import 'package:flutter/material.dart';

class MutasiTransaksi extends StatefulWidget {
  @override
  _MutasiTransaksiPageState createState() => _MutasiTransaksiPageState();
}

class _MutasiTransaksiPageState extends State<MutasiTransaksi> {
  int pemasukan = 0;
  int pengeluaran = 0;
  int get saldo => pemasukan - pengeluaran;

  List<Transaksi> transaksiList = [];

  JenisTransaksi? _jenisDipilih;
  String? _kategoriDipilih;
  int? _nominal;

  final pemasukanKategori = ['Gaji', 'Uang Saku', 'Lainnya'];
  final pengeluaranKategori = [
    'Makan',
    'Minum',
    'Tempat Tinggal',
    'Hiburan',
    'Internet',
    'Transportasi',
    'Kesehatan',
    'Pendidikan',
    'Kecantikan',
    'Olahraga',
    'Belanja',
    'Hobi',
    'Lainnya'
  ];

  void hitungTotal() {
    pemasukan = transaksiList
        .where((t) => t.jenis == JenisTransaksi.pemasukan)
        .fold(0, (sum, item) => sum + item.nominal);
    pengeluaran = transaksiList
        .where((t) => t.jenis == JenisTransaksi.pengeluaran)
        .fold(0, (sum, item) => sum + item.nominal);
  }

  void tambahTransaksi() {
    if (_jenisDipilih != null && _kategoriDipilih != null && _nominal != null) {
      final newTransaksi = Transaksi(
        tanggal:
            '${DateTime.now().day.toString().padLeft(2, '0')}/${DateTime.now().month.toString().padLeft(2, '0')}',
        nominal: _nominal!,
        jenis: _jenisDipilih!,
        kategori: _kategoriDipilih!,
      );
      setState(() {
        transaksiList.add(newTransaksi);
        hitungTotal();
        _nominal = null;
        _kategoriDipilih = null;
        _jenisDipilih = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7193F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text('Sisa Uang Sekarang',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              Text('Rp. $saldo',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(height: 10),
              _inputForm(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _infoBox('Pemasukan', pemasukan, Icons.arrow_downward),
                  SizedBox(width: 10),
                  _infoBox('Pengeluaran', pengeluaran, Icons.arrow_upward),
                ],
              ),
              SizedBox(height: 20),
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Jenis', style: TextStyle(color: Color(0xFF7193F5))),
                    Text('Tanggal', style: TextStyle(color: Color(0xFF7193F5))),
                    Text('Nominal', style: TextStyle(color: Color(0xFF7193F5))),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: transaksiList.length,
                itemBuilder: (context, index) {
                  final transaksi = transaksiList[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 6),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(transaksi.jenis == JenisTransaksi.pemasukan
                              ? 'Pemasukan'
                              : 'Pengeluaran'),
                          Text(transaksi.tanggal),
                          Text('Rp. ${transaksi.nominal}',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Tambah Transaksi',
            style: TextStyle(color: Colors.white, fontSize: 18)),
        SizedBox(height: 12),
        Row(
          children: [
            ChoiceChip(
              label: Text('Pemasukan'),
              selected: _jenisDipilih == JenisTransaksi.pemasukan,
              onSelected: (selected) {
                setState(() {
                  _jenisDipilih = JenisTransaksi.pemasukan;
                  _kategoriDipilih = null;
                });
              },
            ),
            SizedBox(width: 10),
            ChoiceChip(
              label: Text('Pengeluaran'),
              selected: _jenisDipilih == JenisTransaksi.pengeluaran,
              onSelected: (selected) {
                setState(() {
                  _jenisDipilih = JenisTransaksi.pengeluaran;
                  _kategoriDipilih = null;
                });
              },
            ),
          ],
        ),
        SizedBox(height: 12),
        if (_jenisDipilih != null)
          DropdownButtonFormField<String>(
            value: _kategoriDipilih,
            decoration: InputDecoration(
              labelText: 'Kategori',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            items: (_jenisDipilih == JenisTransaksi.pemasukan
                    ? pemasukanKategori
                    : pengeluaranKategori)
                .map((kategori) =>
                    DropdownMenuItem(value: kategori, child: Text(kategori)))
                .toList(),
            onChanged: (val) => setState(() => _kategoriDipilih = val),
          ),
        SizedBox(height: 12),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Nominal',
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white,
          ),
          onChanged: (value) => _nominal = int.tryParse(value),
        ),
        SizedBox(height: 12),
        ElevatedButton(
          onPressed: tambahTransaksi,
          child: Text('Simpan'),
        ),
      ],
    );
  }

  Widget _infoBox(String label, int nominal, IconData icon) {
    return Container(
      width: 150,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black26),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label),
              Icon(icon, size: 16),
            ],
          ),
          SizedBox(height: 4),
          Text('Rp. $nominal'),
        ],
      ),
    );
  }
}

enum JenisTransaksi { pemasukan, pengeluaran }

class Transaksi {
  final String tanggal;
  final int nominal;
  final JenisTransaksi jenis;
  final String kategori;

  Transaksi({
    required this.tanggal,
    required this.nominal,
    required this.jenis,
    required this.kategori,
  });
}
