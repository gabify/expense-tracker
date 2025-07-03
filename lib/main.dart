import 'package:expense_tracker/MainScreen.dart';
import 'package:expense_tracker/Expenses/AddExpense.dart';
import 'package:expense_tracker/Dashboard/Dashboard.dart';
import 'package:expense_tracker/Expenses/ExpenseList.dart';
import 'package:expense_tracker/pages/Profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/' : (context) => MainScreen(),
      '/add' : (context) => Addexpense(),
      '/expenseList' : (context) => Expenselist()
    },
  ));
}