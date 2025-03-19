import 'package:aplikasi2/Asuransi.dart';
import 'package:flutter/material.dart';
import 'Pemahaman_Dasar.dart';
import 'TabungandanPinjaman.dart';
import 'Investasi.dart';
import 'Asuransi.dart';
import 'Perencanaan_Keuangan.dart';

class Literasi extends StatelessWidget {
  const Literasi({super.key});

  @override
  Widget build(BuildContext context) {
    const double buttonRadius = 15;
    const double tebalBorder = 2;
    const double buttonWidth = 200;

    return Stack(
      children: [
        Positioned(
          top: 20,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'LITERASI KEUANGAN',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontSize: 30,
              ),
            ),
          ),
        ),
        Positioned(
          top: 90,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: buttonWidth,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Pemahaman_Dasar()));
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  minimumSize: Size(100, 50),
                  backgroundColor: Colors.white,
                  foregroundColor: Color.fromARGB(255, 105, 147, 245),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(buttonRadius),
                    side: BorderSide(color: Colors.black26, width: tebalBorder),
                  ),
                ),
                child: Text('Pemahaman Dasar Keuangan Pribadai'),
              ),
            ),
          ),
        ),
        Positioned(
          top: 150,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: buttonWidth,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TabungandanPinjaman()));
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  minimumSize: Size(100, 50),
                  backgroundColor: Color(0xFF6993F5),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(buttonRadius),
                    side: BorderSide(color: Colors.black26, width: tebalBorder),
                  ),
                ),
                child: Text('Tabungan dan Pinjaman'),
              ),
            ),
          ),
        ),
        Positioned(
          top: 210,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: buttonWidth,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Investasi()));
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  minimumSize: Size(100, 50),
                  backgroundColor: Colors.white,
                  foregroundColor: Color(0xFF6993F5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(buttonRadius),
                    side: BorderSide(color: Colors.black26, width: tebalBorder),
                  ),
                ),
                child: Text('Investasi'),
              ),
            ),
          ),
        ),
        Positioned(
          top: 270,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: buttonWidth,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Asuransi()));
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  minimumSize: Size(100, 50),
                  backgroundColor: Color(0xFF6993F5),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(buttonRadius),
                    side: BorderSide(color: Colors.black26, width: tebalBorder),
                  ),
                ),
                child: Text('Asuransi'),
              ),
            ),
          ),
        ),
        Positioned(
          top: 330,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: buttonWidth,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Perencanaan_Keuangan()));
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  minimumSize: Size(100, 50),
                  backgroundColor: Colors.white,
                  foregroundColor: Color(0xFF6993F5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(buttonRadius),
                    side: BorderSide(color: Colors.black26, width: tebalBorder),
                  ),
                ),
                child: Text('Perencanaan Keuangan Jangka Panjang'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
