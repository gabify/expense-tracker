import 'package:expense_tracker/Dashboard/BudgetCard.dart';
import 'package:expense_tracker/Dashboard/ExpenseDashboardCard.dart';
import 'package:expense_tracker/Dashboard/SavingsCard.dart';
import 'package:expense_tracker/Services/BudgetProvider.dart';
import 'package:expense_tracker/widgets/AppbarTitle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  
  @override
  Widget build(BuildContext context) {
    final budget = context.watch<BudgetProvider>().budget;

    return Scaffold(
      appBar: AppBar(
        title: AppbarTitle(text: 'Expense Tracker')
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
                      amount: budget.needs,
                      percentage: 50,
                    ),
                  ),
                  Expanded(
                    child: ExpenseDashboardCard(
                      category: 'Wants',
                      amount: budget.wants,
                      percentage: 30,
                    ),
                  ),
                ],
              ),
              SavingsCard(amount: budget.savings,),
            ],
          ),
        ),
      ),
    );
  }
}
