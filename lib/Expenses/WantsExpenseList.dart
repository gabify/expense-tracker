import 'package:expense_tracker/Services/BudgetProvider.dart';
import 'package:expense_tracker/widgets/CustomCircularIndicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ExpenseCard.dart';
import '../Services/expenses.dart';

class WantsExpenseList extends StatefulWidget {
  final List<Expenses> wants;

  const WantsExpenseList({super.key, required this.wants});

  @override
  State<WantsExpenseList> createState() => _WantsExpenseListState();
}

class _WantsExpenseListState extends State<WantsExpenseList> {

  @override
  Widget build(BuildContext context) {
    final double percent = context.read<BudgetProvider>()
        .totalWantsCost / (context.read<BudgetProvider>()
        .budget.total * 0.3);
    final String amount = context.read<BudgetProvider>()
        .formatCurrency(context.read<BudgetProvider>()
        .budget.wants);
    final String limit = context.read<BudgetProvider>()
        .formatCurrency(context.read<BudgetProvider>()
        .budget.total * 0.3);

    if(widget.wants.isEmpty){
      return Center(
        child: Text('Nothing to see here.'),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          CustomCircularIndicator(
            percent: percent,
            amount: amount,
            limit: limit,
            progressColor: Colors.red[500],
            icon: Icon(
              Icons.payments,
              color: Colors.red[500],
              size: 40,
            ),
          ),
          SizedBox(height: 40,),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.wants.length,
            itemBuilder: (context, index){
              return ExpenseCard(expense: widget.wants[index]);
            },
          )
        ],
      ),
    );
  }
}
