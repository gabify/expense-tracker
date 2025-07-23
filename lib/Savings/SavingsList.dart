import 'package:expense_tracker/Savings/SavingsCard.dart';
import 'package:expense_tracker/Services/BudgetProvider.dart';
import 'package:expense_tracker/Services/savings.dart';
import 'package:expense_tracker/widgets/CustomCircularIndicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SavingsList extends StatelessWidget {
  final List<Savings> savings;
  final double totalSavings;

  const SavingsList({super.key, required this.savings, required this.totalSavings});

  @override
  Widget build(BuildContext context) {
    if(savings.isEmpty){
      return Center(
        child: Text('Nothing to see here.'),
      );
    }

    return Column(
      children: [
        CustomCircularIndicator(
            percent: totalSavings / 100000,
            icon: Icon(
              Icons.savings,
              size: context.read<BudgetProvider>().iconsSize(),
              color: Colors.teal[400],
            ),
            amount: context.read<BudgetProvider>().formatCurrency(totalSavings),
            limit: context.read<BudgetProvider>().formatCurrency(100000),
            progressColor: Colors.teal[400],
        ),
        SizedBox(height: 40,),
        Column(
          children: savings.map((savings){
          return SavingsCard(savings: savings,);
          }).toList(),
        )
      ],
    );
  }
}
