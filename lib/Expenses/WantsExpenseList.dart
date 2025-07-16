import 'package:flutter/material.dart';

import 'ExpenseCard.dart';
import '../Services/expenses.dart';

class WantsExpenseList extends StatefulWidget {
  final List<Expenses> wants;

  const WantsExpenseList({super.key, required this.wants});

  @override
  State<WantsExpenseList> createState() => _WantsExpenseListState();
}

class _WantsExpenseListState extends State<WantsExpenseList> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.wants.map((expense){
        return ExpenseCard(expense: expense);
      }).toList(),
    );
  }
}
