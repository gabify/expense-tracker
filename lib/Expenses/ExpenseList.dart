import 'package:expense_tracker/Expenses/NeedsExpenseList.dart';
import 'package:expense_tracker/Expenses/WantsExpenseList.dart';
import 'package:flutter/material.dart';

import 'ExpenseCard.dart';
import '../Services/expenses.dart';

class Expenselist extends StatefulWidget {
  const Expenselist({super.key});

  @override
  State<Expenselist> createState() => _ExpenselistState();
}

class _ExpenselistState extends State<Expenselist> {
  List<Expenses> expenses = [
    Expenses(name:'Electric bill', description: 'Bayad kay Batelec', cost: 1000, category: 'Needs'),
    Expenses(name: 'Internet bill', description: 'Bayad kay GLobe', cost: 1000, category: 'Needs'),
    Expenses(name: 'Shoppee', description: 'dasurv na things', cost: 1000, category: 'Wants'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          backgroundColor: Colors.grey[50],
          title: Text(
            'My Expenses',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                letterSpacing: 0.8
            ),
          ),
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
