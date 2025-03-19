import 'package:flutter/material.dart';

class Budgeting extends StatelessWidget {
  const Budgeting({super.key});

  @override
  Widget build(BuildContext context) {
    const double buttonRadius = 15;
    const double tebalBorder = 2;
    const double buttonWidth = 200;

    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: 20),
            Text(
              'BUDGET',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontSize: 25,
              ),
            ),
            SizedBox(height: 20),
            Positioned(
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: buttonWidth,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(buttonRadius),
                      ),
                      side:
                          BorderSide(color: Colors.black26, width: tebalBorder),
                      backgroundColor: Color(0xFF6993F5),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 20),
                    ),
                    child: Text(
                      'Buat Baru',
                      style: TextStyle(fontSize: 30, fontFamily: 'Montserrat'),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10, height: 30),
            Positioned(
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: buttonWidth,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(buttonRadius),
                      ),
                      side:
                          BorderSide(color: Colors.black26, width: tebalBorder),
                      backgroundColor: Color(0xFF6993F5),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 20),
                    ),
                    child: Text(
                      'Cek',
                      style: TextStyle(fontSize: 30, fontFamily: 'Montserrat'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
