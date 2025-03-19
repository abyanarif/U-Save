import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';

class Loginsignup extends StatelessWidget {
  const Loginsignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 100),
            Center(
              child: Column(
                children: [
                  Text(
                    'WELCOME TO',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  Text(
                    'U-SAVE',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  SizedBox(height: 50),
                  Stack(
                    children: [
                      Image.asset(
                        "assets/images/start.png",
                        width: 1000,
                        height: 663,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 445,
                        left: 115,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF2154D2),
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            'LOG IN',
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 530,
                        left: 110,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Signup()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF6993F5),
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
