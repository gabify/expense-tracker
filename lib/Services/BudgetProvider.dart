import 'package:expense_tracker/Services/Budget.dart';
import 'package:flutter/cupertino.dart';

class BudgetProvider extends ChangeNotifier{
  final _budget = Budget();

  Budget get budget => _budget;

  void addBudget(double total){
    _budget.addBudget(total);
    notifyListeners();
  }

}