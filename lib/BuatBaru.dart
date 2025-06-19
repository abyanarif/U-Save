import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; // import intl
import 'Cek.dart';

class BuatBaru extends StatefulWidget {
  const BuatBaru({super.key});

  @override
  _BuatBaruState createState() => _BuatBaruState();
}

class _BuatBaruState extends State<BuatBaru> {
  final TextEditingController _uangSakuController = TextEditingController();
  final formatter =
      NumberFormat('#,###', 'id_ID'); // formatter untuk pemisah ribuan

  String _selectedCity = "Pilih Kota";
  List<String> cities = [];
  List<String> selectedCategories = [];
  List<TextEditingController> nameControllers = [TextEditingController()];
  List<TextEditingController> amountControllers = [TextEditingController()];

  @override
  void initState() {
    super.initState();
    _loadCitiesFromFirestore();

    // Tambahkan listener untuk memformat input uang saku
    _uangSakuController.addListener(_formatUangSaku);
  }

  void _formatUangSaku() {
    String currentText = _uangSakuController.text;

    // Hilangkan titik atau koma dari string
    String numericString = currentText.replaceAll('.', '').replaceAll(',', '');

    if (numericString.isEmpty) return;

    int? number = int.tryParse(numericString);
    if (number == null) return;

    String formatted = formatter.format(number);

    // Update controller hanya jika hasil format beda dengan teks saat ini
    if (formatted != currentText) {
      _uangSakuController.value = TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length),
      );
    }
  }

  Future<void> _loadCitiesFromFirestore() async {
    print("Mulai load kota...");
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('kota').get();

      List<String> loadedCities =
          snapshot.docs.map((doc) => doc['nama'] as String).toList();

      print('Kota berhasil diambil: $loadedCities');

      setState(() {
        cities = loadedCities;
      });
    } catch (e) {
      print('Gagal mengambil kota: $e');
    }
  }

  void _selectCity() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        if (cities.isEmpty) {
          return Container(
            height: 200,
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        }
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
                              uangSaku: int.tryParse(_uangSakuController.text
                                      .replaceAll('.', '')) ??
                                  0,
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
  void dispose() {
    _uangSakuController.removeListener(_formatUangSaku);
    _uangSakuController.dispose();
    for (var controller in nameControllers) {
      controller.dispose();
    }
    for (var controller in amountControllers) {
      controller.dispose();
    }
    super.dispose();
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCategoryBox("Makan", Icons.restaurant),
                      _buildCategoryBox("Tempat Tinggal", Icons.home),
                      _buildCategoryBox("Internet", Icons.wifi),
                    ],
                  ),
                  SizedBox(height: 10),
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
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryBox(String label, IconData icon) {
    bool isSelected = selectedCategories.contains(label);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedCategories.remove(label);
          } else {
            selectedCategories.add(label);
          }
        });
      },
      child: Container(
        width: 110,
        height: 100,
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: isSelected ? Color.fromARGB(255, 105, 147, 245) : Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                size: 50, color: isSelected ? Colors.white : Colors.black),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
