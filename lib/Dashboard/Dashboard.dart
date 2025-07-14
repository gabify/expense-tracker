import 'package:expense_tracker/Dashboard/BudgetCard.dart';
import 'package:expense_tracker/Dashboard/ExpenseDashboardCard.dart';
import 'package:expense_tracker/Dashboard/SavingsCard.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        title: Container(
          padding: EdgeInsets.only(bottom: 1),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.teal,
                width: 2
              )
            )
          ),
          child: Text(
            'Expense Tracker',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              letterSpacing: 0.8,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 10,),
              BudgetCard(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ExpenseDashboardCard(
                      category: 'Needs',
                      amount: 10000,
                      percentage: 50,
                      color: Colors.yellow[800],
                    ),
                  ),
                  Expanded(
                    child: ExpenseDashboardCard(
                      category: 'Wants',
                      amount: 5000,
                      percentage: 30,
                      color: Colors.red[500],
                    ),
                  ),
                ],
              ),
              SavingsCard(),
            ],
          ),
        ),
      ),
    );
  }
}
