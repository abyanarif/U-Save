import 'package:flutter/material.dart';
import 'package:aplikasi2/riwayat.dart';
import 'BuatBaru.dart';
import 'Cek.dart';
import 'BudgetCard.dart';

class Budgeting extends StatelessWidget {
  const Budgeting({super.key});

  @override
  Widget build(BuildContext context) {
    const double buttonRadius = 15;
    const double tebalBorder = 2;
    const double buttonWidth = 250;

    return Scaffold(
      backgroundColor: const Color(0xFF6993F5),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 80),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'BUDGETING',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: buttonWidth,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BuatBaru()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(buttonRadius),
                  ),
                  side: const BorderSide(
                      color: Colors.black26, width: tebalBorder),
                  backgroundColor: const Color(0xFF6993F5),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  elevation: 5,
                ),
                child: const Text(
                  'Buat Baru',
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: buttonWidth,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RiwayatTerakhir(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(buttonRadius),
                  ),
                  side: const BorderSide(
                      color: Colors.black26, width: tebalBorder),
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF6993F5),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  elevation: 5,
                ),
                child: const Text(
                  'Riwayat Terakhir',
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
