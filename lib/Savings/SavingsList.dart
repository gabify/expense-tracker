import 'package:expense_tracker/Savings/SavingsCard.dart';
import 'package:expense_tracker/Services/savings.dart';
import 'package:flutter/material.dart';

class SavingsList extends StatelessWidget {
  final List<Savings> savings;

  const SavingsList({super.key, required this.savings});

  @override
  Widget build(BuildContext context) {
    if(savings.isEmpty){
      return Center(
        child: Text('Nothing to see here.'),
      );
    }

    return Column(
      children: savings.map((savings){
        return SavingsCard(savings: savings,);
      }).toList(),
    );
  }
}
