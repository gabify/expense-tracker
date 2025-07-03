import 'package:flutter/material.dart';

import 'ExpenseCard.dart';
import 'expenses.dart';

class NeedsExpenseList extends StatefulWidget {
  const NeedsExpenseList({super.key});

  @override
  State<NeedsExpenseList> createState() => _NeedsExpenseListState();
}

class _NeedsExpenseListState extends State<NeedsExpenseList> {

  List<Expenses> expenses = [
  Expenses(name:'Electric bill', description: 'Bayad kay Batelec', cost: 1000),
  Expenses(name: 'Internet bill', description: 'Bayad kay GLobe', cost: 1000),
  Expenses(name: 'Shoppee', description: 'dasurv na things', cost: 1000),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: expenses.map((expense){
        return ExpenseCard(expense: expense);
      }).toList(),
    );
  }
}
