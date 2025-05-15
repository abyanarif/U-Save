import 'package:flutter/material.dart';
import 'Cek.dart';

class BuatBaru extends StatefulWidget {
  const BuatBaru({super.key});

  @override
  _BuatBaruState createState() => _BuatBaruState();
}

class _BuatBaruState extends State<BuatBaru> {
  final TextEditingController _uangSakuController = TextEditingController();
  String _selectedCity = "Pilih Kota";
  List<String> cities = [
    "Surabaya",
    "Malang",
    "Sidoarjo",
    "Gresik",
    "Banyuwangi"
  ];
  List<String> selectedCategories = []; // Menyimpan kategori yang dipilih
  List<TextEditingController> nameControllers = [TextEditingController()];
  List<TextEditingController> amountControllers = [TextEditingController()];

  void _selectCity() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView.builder(
          itemCount: cities.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(cities[index]),
              onTap: () {
                setState(() {
                  _selectedCity = cities[index];
                });
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }

  void _showAddExpenseDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateModal) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Masukkan Pengeluaran Lainnya Perbulan",
                        style: TextStyle(
                            fontSize: 16, fontStyle: FontStyle.italic)),
                    SizedBox(height: 10),

                    // List Input Pengeluaran
                    Column(
                      children: List.generate(nameControllers.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 105, 147, 245),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                TextField(
                                  controller: nameControllers[index],
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: "Nama Pengeluaran",
                                    hintStyle: TextStyle(color: Colors.white70),
                                    border: InputBorder.none,
                                  ),
                                ),
                                // Input Nominal
                                SizedBox(
                                  width: 80,
                                  child: TextField(
                                    controller: amountControllers[index],
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                    decoration: InputDecoration(
                                      hintText: "0",
                                      hintStyle:
                                          TextStyle(color: Colors.white70),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),

                    SizedBox(height: 10),

                    // Tombol Tambah +
                    IconButton(
                      onPressed: () {
                        setStateModal(() {
                          nameControllers.add(TextEditingController());
                          amountControllers.add(TextEditingController());
                        });
                      },
                      icon: Icon(Icons.add_circle,
                          color: Color.fromARGB(255, 105, 147, 245), size: 40),
                    ),

                    SizedBox(height: 10),

                    // Tombol Submit
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 105, 147, 245),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        minimumSize: Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        // Konversi tambahan pengeluaran ke Map<String, int>
                        Map<String, int> tambahan = {};
                        for (int i = 0; i < nameControllers.length; i++) {
                          String nama = nameControllers[i].text;
                          int nominal =
                              int.tryParse(amountControllers[i].text) ?? 0;
                          if (nama.isNotEmpty && nominal > 0) {
                            tambahan[nama] = nominal;
                          }
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Cek(
                              uangSaku:
                                  int.tryParse(_uangSakuController.text) ?? 0,
                              selectedCity: _selectedCity,
                              selectedCategories: selectedCategories,
                              tambahanPengeluaran: tambahan,
                            ),
                          ),
                        );
                      },
                      child: Text("Submit"),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 105, 147, 245),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 105, 147, 245),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Buat Baru", style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),

          // Input Uang Saku
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black),
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: _uangSakuController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Masukkan Uang Saku",
                ),
              ),
            ),
          ),
          SizedBox(height: 10),

          // Tombol Pilih Kota
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 105, 147, 245),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.black),
                ),
                minimumSize: Size(double.infinity, 70),
              ),
              onPressed: _selectCity,
              child: Text(_selectedCity, style: TextStyle(fontSize: 22)),
            ),
          ),
          SizedBox(height: 20),

          // Kategori Pengeluaran (3 di atas, 2 di bawah)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // Baris pertama (3 kotak)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCategoryBox("Makan", Icons.restaurant),
                    _buildCategoryBox("Tempat Tinggal", Icons.home),
                    _buildCategoryBox("Internet", Icons.wifi),
                  ],
                ),
                SizedBox(height: 10),

                // Baris kedua (2 kotak)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCategoryBox("Hiburan", Icons.mic),
                    _buildCategoryBox("Dana Darurat", Icons.savings),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Tombol Lainnya
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: _showAddExpenseDialog,
            child: Text("Lainnya"),
          ),
        ],
      ),
    );
  }

  // Widget untuk Kategori dalam Kotak
  Widget _buildCategoryBox(String label, IconData icon) {
    bool isSelected =
        selectedCategories.contains(label); // Memeriksa apakah kategori dipilih
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedCategories
                .remove(label); // Menghapus kategori jika sudah dipilih
          } else {
            selectedCategories.add(label); // Menambahkan kategori yang dipilih
          }
        });
      },
      child: Container(
        width: 110,
        height: 100,
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: isSelected ? Color.fromARGB(255, 105, 147, 245) : Colors.white,
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                size: 30, color: isSelected ? Colors.white : Colors.black),
            SizedBox(height: 5),
            Text(label,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    color: isSelected ? Colors.white : Colors.black)),
          ],
        ),
      ),
    );
  }
}
