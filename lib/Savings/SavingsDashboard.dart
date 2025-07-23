import 'package:expense_tracker/Savings/SavingsList.dart';
import 'package:expense_tracker/Services/BudgetProvider.dart';
import 'package:expense_tracker/widgets/AppbarTitle.dart';
import 'package:expense_tracker/widgets/CustomCircularIndicator.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class SavingsDashboard extends StatelessWidget {
  const SavingsDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.watch<BudgetProvider>().savings;
    final totalSavings = context.watch<BudgetProvider>().totalSavings;

    return Scaffold(
        appBar: AppBar(
          title: AppbarTitle(text: 'My Savings',)
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
        child: SingleChildScrollView(
          child: SavingsList(savings: data, totalSavings: totalSavings)
        ),
      ),
    );
  }
}
