import 'package:expense_tracker/MainScreen.dart';
import 'package:expense_tracker/Expenses/AddExpense.dart';
import 'package:expense_tracker/Dashboard/Dashboard.dart';
import 'package:expense_tracker/Expenses/ExpenseList.dart';
import 'package:expense_tracker/Services/BudgetProvider.dart';
import 'package:expense_tracker/pages/Profile.dart';
import 'package:expense_tracker/pages/Sandbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BudgetProvider(),
      child: MaterialApp(
        routes: {
          '/' : (context) => MainScreen(),
          '/add' : (context) => Addexpense(),
          '/expenseList' : (context) => Expenselist()
        },
      ),
    )
  );
}