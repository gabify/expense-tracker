import 'package:expense_tracker/Services/BudgetProvider.dart';
import 'package:expense_tracker/widgets/CustomCircularIndicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ExpenseCard.dart';
import '../Services/expenses.dart';

class NeedsExpenseList extends StatefulWidget {
  final List<Expenses> needs;

  const NeedsExpenseList({super.key, required this.needs});

  @override
  State<NeedsExpenseList> createState() => _NeedsExpenseListState();
}

class _NeedsExpenseListState extends State<NeedsExpenseList> {


  @override
  Widget build(BuildContext context) {
    final double percent = context.read<BudgetProvider>()
        .totalNeedsCost / (context.read<BudgetProvider>()
        .budget.total * 0.5);
    final String amount = context.read<BudgetProvider>()
        .formatCurrency(context.read<BudgetProvider>()
        .budget.needs);
    final String limit = context.read<BudgetProvider>()
        .formatCurrency(context.read<BudgetProvider>()
        .budget.total * 0.5);

    if(widget.needs.isEmpty){
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
            itemCount: widget.needs.length,
            itemBuilder: (context, index){
              return ExpenseCard(expense: widget.needs[index]);
            }
          ),
        ],
      ),
    );
  }
}
