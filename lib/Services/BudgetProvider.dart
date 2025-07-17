import 'package:expense_tracker/Services/Budget.dart';
import 'package:expense_tracker/Services/DatabaseHelper.dart';
import 'package:expense_tracker/Services/expenses.dart';
import 'package:flutter/cupertino.dart';

class BudgetProvider extends ChangeNotifier{
  final _budget = Budget(0, 0.0, '');
  List<Expenses> _expenses = [];

  //Load expenses from db
  Future<void> loadExpenses() async{
    final data = await DatabaseHelper().getAllExpenses();
    _expenses = data.map((e) => Expenses.fromMap(e)).toList();
    notifyListeners();
  }

  //Load budget
  Future<void> loadBudget() async{
    final data = await DatabaseHelper().getCurrentBudget();
    final budget = Budget.fromMap(data.first);
    _budget.addBudget(budget.total, budget.created_at);

    notifyListeners();
  }

  //Add expenses
  Future<void> addExpense(Expenses expense) async{
    _expenses.add(expense);
    notifyListeners();

    await DatabaseHelper().insertExpense(expense.toMap());
  }

  //Getters
  List<Expenses> get expenses => List.unmodifiable(_expenses);
  Budget get budget => _budget;

  Future<void> addBudget(double total, String created_at) async{
    _budget.addBudget(total, created_at);
    notifyListeners();

    await DatabaseHelper().insertBudget(_budget.toMap());
  }

}