import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'budgeting.dart';
import 'Cek.dart';

class BudgetCard extends StatelessWidget {
  final String title;
  final int amount;
  final NumberFormat formatter;

  const BudgetCard({
    super.key,
    required this.title,
    required this.amount,
    required this.formatter,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 105, 147, 245),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, blurRadius: 5, offset: Offset(0, 2)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Center(
              child: Text(
                "Rp ${formatter.format(amount)}",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            )
          ],
        ),
      ),
    );
  }
}
