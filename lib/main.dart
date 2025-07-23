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
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[50],
          cardTheme: CardThemeData(
            color: Colors.teal[100],
            elevation: 2,
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.grey[50]
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[800],
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.vertical(
                        top: Radius.circular(7),
                        bottom: Radius.circular(7)
                    )
                )
            ),
          )
        ),
        routes: {
          '/' : (context) => MainScreen(),
          '/add' : (context) => Addexpense(),
          '/expenseList' : (context) => Expenselist()
        },
      ),
    )
  );
}