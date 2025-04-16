import 'package:flutter/material.dart';
import 'BuatBaru.dart';
import 'Cek.dart';

class Budgeting extends StatelessWidget {
  const Budgeting({super.key});

  @override
  Widget build(BuildContext context) {
    const double buttonRadius = 15;
    const double tebalBorder = 2;
    const double buttonWidth = 250;

    return Scaffold(
      backgroundColor: Color(0xFF6993F5),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 40, left: 80), // Menggeser teks Budget ke atas
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'BUDGETING',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: buttonWidth,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BuatBaru()));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(buttonRadius),
                  ),
                  side: BorderSide(color: Colors.black26, width: tebalBorder),
                  backgroundColor: Color(0xFF6993F5),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  elevation: 5,
                ),
                child: Text(
                  'Buat Baru',
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: buttonWidth,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Cek(
                                uangSaku: 0,
                                selectedCity: '',
                                selectedCategories: [],
                                tambahanPengeluaran: {},
                              )));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(buttonRadius),
                  ),
                  side: BorderSide(color: Colors.black26, width: tebalBorder),
                  backgroundColor: Colors.white,
                  foregroundColor: Color(0xFF6993F5),
                  padding: EdgeInsets.symmetric(vertical: 20),
                  elevation: 5,
                ),
                child: Text(
                  'Cek',
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6993F5),
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
