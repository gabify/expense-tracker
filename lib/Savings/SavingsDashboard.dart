import 'package:expense_tracker/Savings/SavingsList.dart';
import 'package:expense_tracker/Services/BudgetProvider.dart';
import 'package:expense_tracker/Services/savings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SavingsDashboard extends StatelessWidget {
  const SavingsDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.watch<BudgetProvider>().savings;
    return Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          backgroundColor: Colors.grey[50],
          title: Container(
            padding: EdgeInsets.only(bottom: 1),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Colors.teal,
                        width: 2
                    )
                )
            ),
            child: Text(
              'My Savings',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                letterSpacing: 0.8,
              ),
            ),
          ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: SavingsList(savings: data),
      ),
    );
  }
}
