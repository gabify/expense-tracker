import 'package:flutter/material.dart';

import 'ExpenseCard.dart';
import '../Services/expenses.dart';

class NeedsExpenseList extends StatefulWidget {
  final List<Expenses> needs;

  const NeedsExpenseList({super.key, required this.needs});

  @override
  State<NeedsExpenseList> createState() => _NeedsExpenseListState();
}

class _NeedsExpenseListState extends State<NeedsExpenseList> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.needs.map((expense){
        return ExpenseCard(expense: expense);
      }).toList(),
    );
  }
}
