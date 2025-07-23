import 'package:expense_tracker/Services/Budget.dart';
import 'package:expense_tracker/Services/DatabaseHelper.dart';
import 'package:expense_tracker/Services/expenses.dart';
import 'package:expense_tracker/Services/savings.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

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
    if(expense.category == 'Needs'){
      _recalculateNeeds(expense.cost);
    } else if(expense.category == 'Wants'){
      _recalculateWants(expense.cost);
    }

    await DatabaseHelper().insertExpense(expense.toMap());

    notifyListeners();
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
      _recalculateNeeds(totalNeedsCost);
      _recalculateWants(totalWantsCost);
    }
  }

  void _recalculateNeeds(double amount){
    _budget.setNeeds = _budget.needs - amount;
  }

  void _recalculateWants(double amount){
    _budget.setWants = _budget.wants - amount;
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

  //Currency formatter function
  String formatCurrency(double amount){
    final formatter = NumberFormat.currency(locale: 'en_PH', symbol: '₱');
    return formatter.format(amount);
  }

  //Icons Size calculator
  double iconsSize(){
    final double minSize = 20;
    final double maxSize = 100;

    double ratio = (totalSavings / 100000.0).clamp(0, 1);
    return minSize + ratio * (maxSize - 20);
  }

}