import 'package:expense_tracker/Services/BudgetProvider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SavingsCard extends StatelessWidget {
  final double amount;
  Color? color;

  SavingsCard({super.key, required this.amount}){
    if(amount <= 1000.0 && amount >= 500.0){
      color = Colors.yellow[800];
    } else if(amount < 500.0){
      color = Colors.red[500];
    }else{
      color = Colors.green[500];
    }
  }

  @override
  Widget build(BuildContext context) {
    final totalSavings = context.watch<BudgetProvider>().totalSavings;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Container(
              padding: EdgeInsets.all(20),
              height: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Savings',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          Text(
                            '20% of your budget',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        context.read<BudgetProvider>().formatCurrency(amount),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: color
                        ),
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.read<BudgetProvider>().formatCurrency(totalSavings),
                        style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        'Your total savings as of ${DateFormat('MMMM').format(DateTime.now())}',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]);
  }
}
