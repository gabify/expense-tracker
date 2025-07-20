import 'package:expense_tracker/Savings/SavingsList.dart';
import 'package:expense_tracker/Services/BudgetProvider.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class SavingsDashboard extends StatelessWidget {
  const SavingsDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.watch<BudgetProvider>().savings;
    final totalSavings = context.watch<BudgetProvider>().totalSavings;
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
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircularPercentIndicator(
                radius: 120,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.savings,
                      size: 40,
                      color: Colors.teal[400],
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'P ${totalSavings}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'of P 1,000,000.00',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                progressColor: Colors.teal[400],
                percent: 0.3,
                animation: true,
                backgroundWidth: 14,
                lineWidth: 14,
              ),
              SizedBox(height: 40,),
              SavingsList(savings: data)
            ],
          ),
        ),
      ),
    );
  }
}
