import 'package:flutter/material.dart';

import 'ExpenseCard.dart';
import 'expenses.dart';

class WantsExpenseList extends StatefulWidget {
  const WantsExpenseList({super.key});

  @override
  State<WantsExpenseList> createState() => _WantsExpenseListState();
}

class _WantsExpenseListState extends State<WantsExpenseList> {

  List<Expenses> expenses = [
    Expenses(name:'Shopee', description: 'Mga utik-utik', cost: 1000),
    Expenses(name: 'Iphone16', description: 'Hulog sa Iphone', cost: 1000),
    Expenses(name: 'PS5', description: 'Hulog sa PS5', cost: 1000),
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
