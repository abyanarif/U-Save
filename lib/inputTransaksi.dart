import 'package:flutter/material.dart';

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
                      color: Color(0xFF6993F5),
                    ),
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
