import 'package:expense_tracker/Expenses/NeedsExpenseList.dart';
import 'package:expense_tracker/Expenses/WantsExpenseList.dart';
import 'package:expense_tracker/Services/BudgetProvider.dart';
import 'package:expense_tracker/widgets/AppbarTitle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ExpenseCard.dart';
import '../Services/expenses.dart';

class Expenselist extends StatefulWidget {
  const Expenselist({super.key});

  @override
  State<Expenselist> createState() => _ExpenselistState();
}

class _ExpenselistState extends State<Expenselist> {

  @override
  Widget build(BuildContext context) {
    final expenses = context.watch<BudgetProvider>().expenses;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: AppbarTitle(text: 'My Expenses',),
          bottom: TabBar(
            indicatorColor: Colors.teal,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: TextStyle(
              color: Colors.teal,
              fontSize: 17
            ),
            tabs: [
              Text('Needs'),
              Text('Wants')
            ],
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: TabBarView(
              children: [
                NeedsExpenseList(needs: expenses.where((i) => i.category == 'Needs').toList()),
                WantsExpenseList(wants: expenses.where((i) => i.category == 'Wants').toList())
              ]
          ),
        ),
      ),
    );
  }
}
