import 'package:flutter/material.dart';
import 'loginSignup.dart';

class WelcomePage3 extends StatelessWidget {
  const WelcomePage3({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/bg.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: double.infinity,
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
                                    top: 470,
                                    left: 100,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          text:
                                              'U-Save dapat Mencatat\nPengeluaran anda sehari\nhari dan menampilkan\npengeluaran tiap bulan',
                                          style: TextStyle(fontSize: 20, color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 560,
                                    left: 290,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Loginsignup()));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 5),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.black,
                                        size: 30,
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
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}