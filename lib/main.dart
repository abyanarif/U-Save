import 'package:flutter/material.dart';

const double buttonRadius = 15;
const double tebalBorder = 2;
const double buttonWidth = 200;

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyApp> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF6993F5),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
              child: AppBar(
                  backgroundColor: Color(0xD5E5FBFF),
                  title: SizedBox(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'U-Save',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Montserrat'),
                        ),
                        Text(
                          'Mari Belajar',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 35,
                              fontFamily: 'Montserrat'),
                        ),
                      ],
                    ),
                  )))),
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: [
            Literasi(),
            Budgeting(),
            InputTransaksi(),
            MutasiTransaksi(),
            InformasiAkun()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.book), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.event_note), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.wallet_rounded), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: '')
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black54,
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class Literasi extends StatelessWidget {
  const Literasi({super.key});

  @override
  Widget build(BuildContext context) {
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
            )),
        Positioned(
            top: 90,
            left: 0,
            right: 0,
            child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: buttonWidth,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          minimumSize: Size(100, 50),
                          backgroundColor: Colors.white,
                          foregroundColor: Color(0xFF6993F5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(buttonRadius),
                              side: BorderSide(
                                  color: Colors.black26, width: tebalBorder))),
                      child: Text('Pengertian')),
                ))),
        Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: buttonWidth,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        minimumSize: Size(100, 50),
                        backgroundColor: Color(0xFF6993F5),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(buttonRadius),
                            side: BorderSide(
                                color: Colors.black26, width: tebalBorder))),
                    child: Text('Tujuan')),
              ),
            )),
        Positioned(
            top: 210,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: buttonWidth,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        minimumSize: Size(100, 50),
                        backgroundColor: Colors.white,
                        foregroundColor: Color(0xFF6993F5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(buttonRadius),
                            side: BorderSide(
                                color: Colors.black26, width: tebalBorder))),
                    child: Text('Manfaat')),
              ),
            )),
        Positioned(
            top: 270,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: buttonWidth,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        minimumSize: Size(100, 50),
                        backgroundColor: Color(0xFF6993F5),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(buttonRadius),
                            side: BorderSide(
                                color: Colors.black26, width: tebalBorder))),
                    child: Text('Dampak')),
              ),
            )),
        Positioned(
            top: 330,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: buttonWidth,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        minimumSize: Size(100, 50),
                        backgroundColor: Colors.white,
                        foregroundColor: Color(0xFF6993F5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(buttonRadius),
                            side: BorderSide(
                                color: Colors.black26, width: tebalBorder))),
                    child: Text('Mengatasi Dampak')),
              ),
            )),
      ],
    );
  }
}

class Budgeting extends StatelessWidget {
  const Budgeting({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text('BUDGET',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Montserrat', fontSize: 25)),
          SizedBox(
            height: 20,
          ),
          Positioned(
              child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: buttonWidth,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(buttonRadius)),
                    side: BorderSide(color: Colors.black26, width: tebalBorder),
                    backgroundColor: Color(0xFF6993F5),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 20)),
                child: Text(
                  'Buat Baru',
                  style: TextStyle(fontSize: 30, fontFamily: 'Montserrat'),
                ),
              ),
            ),
          )),
          SizedBox(
            width: 10,
            height: 30,
          ),
          Positioned(
              child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: buttonWidth,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(buttonRadius)),
                      side:
                          BorderSide(color: Colors.black26, width: tebalBorder),
                      backgroundColor: Color(0xFF6993F5),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 20)),
                  child: Text(
                    'Cek',
                    style: TextStyle(fontSize: 30, fontFamily: 'Montserrat'),
                  )),
            ),
          ))
        ],
      )
    ]);
  }
}

class InputTransaksi extends StatelessWidget {
  const InputTransaksi({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      "Makanan",
      "Belanja",
      "Pakaian",
      "Olahraga",
      "Minuman",
      "Hiburan",
      "Tempat Tinggal",
      "Kecantikan",
      "Pendidikan",
      "Transportasi",
      "Internet",
      "Lainnya",
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                    "Pengeluaran",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20,
                        color: Color(0xFF6993F5)),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                    "Pemasukan",
                    style: TextStyle(fontFamily: 'Montserrat', fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.5,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return _buildCategoryButton(categories[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryButton(String text) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(vertical: 15),
      ),
      child: Text(
        text,
        style: TextStyle(fontFamily: 'Montserrat', fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class MutasiTransaksi extends StatelessWidget {
  const MutasiTransaksi({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [Center(child: Text('Ini adalah halaman Mutasi!'))]);
  }
}

class InformasiAkun extends StatelessWidget {
  const InformasiAkun({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [Center(child: Text('Ini adalah halaman Informasi Akun!'))]);
  }
}
