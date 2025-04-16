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
    const double buttonWidth = 250;
    const double buttonHeight = 65;
    const double fontSize = 18;

    return Scaffold(
      backgroundColor: Color(0xFF6993F5),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Text(
              'LITERASI KEUANGAN',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 20),
            buildButton(
              context,
              'Pemahaman Dasar Keuangan Pribadi',
              () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Pemahaman_Dasar())),
              isPrimary: false,
              buttonHeight: buttonHeight,
              fontSize: fontSize,
            ),
            const SizedBox(height: 20),
            buildButton(
              context,
              'Tabungan dan Pinjaman',
              () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TabungandanPinjaman())),
              isPrimary: true,
              buttonHeight: buttonHeight,
              fontSize: fontSize,
            ),
            const SizedBox(height: 20),
            buildButton(
              context,
              'Investasi',
              () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Investasi())),
              isPrimary: false,
              buttonHeight: buttonHeight,
              fontSize: fontSize,
            ),
            const SizedBox(height: 20),
            buildButton(
              context,
              'Asuransi',
              () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Asuransi())),
              isPrimary: true,
              buttonHeight: buttonHeight,
              fontSize: fontSize,
            ),
            const SizedBox(height: 20),
            buildButton(
              context,
              'Perencanaan Keuangan Jangka Panjang',
              () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Perencanaan_Keuangan())),
              isPrimary: false,
              buttonHeight: buttonHeight,
              fontSize: fontSize,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(
    BuildContext context,
    String text,
    VoidCallback onPressed, {
    required bool isPrimary,
    required double buttonHeight,
    required double fontSize,
  }) {
    return SizedBox(
      width: 250,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          minimumSize: Size(100, 80),
          backgroundColor: isPrimary ? const Color(0xFF6993F5) : Colors.white,
          foregroundColor: isPrimary ? Colors.white : const Color(0xFF6993F5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(color: Colors.black26, width: 2),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
