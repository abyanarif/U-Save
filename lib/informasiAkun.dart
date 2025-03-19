import 'package:flutter/material.dart';

class InformasiAkun extends StatefulWidget {
  @override
  _InformasiAkunState createState() => _InformasiAkunState();
}

class _InformasiAkunState extends State<InformasiAkun> {
  bool editUniversitas = false; // Status apakah lagi edit atau nggak
  String universitas = ''; // Nilai default universitas
  TextEditingController universitasController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6993F5),
      body: Column(
        children: [
          SizedBox(height: 40),

          // Username
          FieldProfile(icon: Icons.person, text: 'abyan1132'),

          SizedBox(height: 15),

          // Email
          FieldProfile(icon: Icons.email, text: 'a***23@gmail.com'),

          SizedBox(height: 15),

          // Password
          FieldProfile(icon: Icons.lock, text: 'a***********'),

          SizedBox(height: 15),

          // Universitas (editable)
          GestureDetector(
            onTap: () {
              setState(() {
                editUniversitas = true;
                universitasController.text = universitas; // Pre-fill
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  Icon(Icons.account_balance, size: 25),
                  SizedBox(width: 15),
                  Expanded(
                    child: editUniversitas
                        ? TextField(
                            controller: universitasController,
                            autofocus: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Masukkan Universitas',
                            ),
                            onSubmitted: (value) {
                              setState(() {
                                universitas =
                                    value.isNotEmpty ? value : 'Universitas';
                                editUniversitas = false;
                              });
                            },
                          )
                        : Text(
                            universitas,
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                              color: universitas == 'Universitas'
                                  ? Colors.grey
                                  : Colors.black,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 40),

          GestureDetector(
            onTap: () {
              // Aksi log out
              Navigator.pop(context);
            },
            child: Text(
              'Log Out',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'Montserrat',
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget reusable buat field profile biasa (non-editable)
class FieldProfile extends StatelessWidget {
  final IconData icon;
  final String text;

  const FieldProfile({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Icon(icon, size: 25),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
