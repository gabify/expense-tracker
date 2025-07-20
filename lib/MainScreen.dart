import 'package:expense_tracker/Savings/SavingsDashboard.dart';
import 'package:expense_tracker/Services/BudgetProvider.dart';
import 'package:expense_tracker/Services/InAppNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Expenses/ExpenseList.dart';
import 'Dashboard/Dashboard.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _selected_items = 0;

  void _onItemTapped(int index){
    setState(() => _selected_items = index);
  }

  final List<Widget> _pages = <Widget>[
    Dashboard(),
    Expenselist(),
    SavingsDashboard()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      await _initData();
      _isBudgetExpired();
    });
  }

  Future<void> _initData() async{
    await context.read<BudgetProvider>().loadExpenses();
    await context.read<BudgetProvider>().loadBudget();
    await context.read<BudgetProvider>().loadSavings();
  }

  void _isBudgetExpired() {
    if(context.read<BudgetProvider>().checkBudget()){
      showDialog(
        context: context,
        builder: (_) => InAppNotifier(
            title: Text('Alert'),
            content: Text('You may need to add a new budget for this month'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('ok')
              )
            ]
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selected_items),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.pushNamed(context, '/add');
        },
        label: Text(
          'Add Expense',
          style: TextStyle(
              color: Colors.white
          ),
        ),
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.teal[800],
        elevation: 1.7,
      ),

      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.teal[300],
          currentIndex: _selected_items,
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.monetization_on,
                ),
                label: 'Expenses'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.savings),
                label: 'Savings'
            ),
          ]
      ),
    );
  }
}
