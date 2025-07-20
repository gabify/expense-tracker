import 'package:expense_tracker/Services/Budget.dart';
import 'package:expense_tracker/Services/DatabaseHelper.dart';
import 'package:expense_tracker/Services/expenses.dart';
import 'package:expense_tracker/Services/savings.dart';
import 'package:flutter/cupertino.dart';

class BudgetProvider extends ChangeNotifier{
  final _budget = Budget(0, 0.0, '');
  List<Expenses> _expenses = [];
  List<Savings> _savings = [];

  //Load expenses from db
  Future<void> loadExpenses() async{
    final data = await DatabaseHelper().getAllExpenses();
    _expenses = data.map((e) => Expenses.fromMap(e)).toList();
    _recalculate();
    notifyListeners();
  }

  //Load budget from db
  Future<void> loadBudget() async{
    final data = await DatabaseHelper().getCurrentBudget();
    final budget = Budget.fromMap(data.first);

    if(budget.isNotEmpty) {
      _budget.addBudget(budget.total, budget.created_at);
      _recalculate();
    }

    notifyListeners();
  }

  //load savings from db
  Future<void> loadSavings() async{
    final data = await DatabaseHelper().getAllBudget();
    _savings = data.map((e) => Savings.fromMap(e)).toList();

    notifyListeners();
  }

  //Add expenses
  Future<void> addExpense(Expenses expense) async{
    _expenses.add(expense);
    _recalculate();
    notifyListeners();

    await DatabaseHelper().insertExpense(expense.toMap());
  }

  //Getters
  List<Expenses> get expenses => List.unmodifiable(_expenses);
  List<Savings> get savings => List.unmodifiable(_savings);
  Budget get budget => _budget;
  double get totalNeedsCost => _expenses
      .where((i) => i.category == 'Needs')
      .fold<double>(0.0, (sum, next) => sum + next.cost);
  double get totalWantsCost => _expenses
      .where((i) => i.category == 'Wants')
      .fold<double>(0.0, (sum, next) => sum + next.cost);
  double get totalSavings => _savings
      .fold<double>(0.0, ((sum, next) => sum + next.amount));


  //Add budget
  Future<void> addBudget(double total, String created_at) async{
    _budget.addBudget(total, created_at);
    _savings.add(Savings(amount: total * 0.2, date: created_at));
    notifyListeners();

    await DatabaseHelper().insertBudget(_budget.toMap());
  }

  //recalculate the budget based on the expenses
  void _recalculate(){
    if(_budget.isNotEmpty && _expenses.isNotEmpty){
      _budget.setNeeds = _budget.needs - totalNeedsCost;
      _budget.setWants = _budget.wants - totalWantsCost;
    }
  }

  //check if the budget is past 1 month
  bool checkBudget(){
    if(_budget.isNotEmpty){
      final created = DateTime.parse(_budget.created_at);
      final now = DateTime.now();
      final oneMonthLater = DateTime(created.year, created.month + 1, created.day);
      return now.isAfter(oneMonthLater);

      //This is for testing
      //final fakeDate = DateTime.now().subtract(Duration(days: 31));
      //return now.isAfter(fakeDate);
    }
    return false;
  }

}