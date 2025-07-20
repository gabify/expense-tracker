import 'package:expense_tracker/Services/savings.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SavingsCard extends StatelessWidget {
  final Savings savings;
  const SavingsCard({super.key, required this.savings});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('MMM d, y').format(DateTime.parse(savings.date)),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.grey[900]
                      ),
                    ),
                  ],
                ),
                Text(
                  '+ ₱${savings.amount.toString()}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.green
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
