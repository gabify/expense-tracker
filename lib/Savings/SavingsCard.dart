import 'package:expense_tracker/Services/BudgetProvider.dart';
import 'package:expense_tracker/Services/savings.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SavingsCard extends StatelessWidget {
  final Savings savings;
  const SavingsCard({super.key, required this.savings});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[50],
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        margin: EdgeInsets.symmetric(vertical: 7),
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
                  '+ ${context.read<BudgetProvider>().formatCurrency(savings.amount)}',
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
