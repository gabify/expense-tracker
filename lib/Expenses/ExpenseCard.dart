import 'package:expense_tracker/Services/BudgetProvider.dart';
import 'package:expense_tracker/Services/expenses.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseCard extends StatelessWidget {
  
  final Expenses expense;
  const ExpenseCard({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[50],
      child: Container(
        padding: EdgeInsets.all(10),
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
                      expense.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.grey[900]
                      ),
                    ),
                    Text(
                      expense.description,
                      style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 14,
                          color: Colors.grey[700]
                      ),
                    )
                  ],
                ),
                Text(
                  '- ${context.read<BudgetProvider>().formatCurrency(expense.cost)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.redAccent
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
