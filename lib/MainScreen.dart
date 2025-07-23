import 'package:expense_tracker/Savings/SavingsDashboard.dart';
import 'package:expense_tracker/Services/BudgetProvider.dart';
import 'package:expense_tracker/widgets/InAppNotifier.dart';
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
    SavingsDashboard(),
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

      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          onPressed: (){
            Navigator.pushNamed(context, '/add');
          },
          backgroundColor: Colors.teal[800],
          elevation: 1.7,
          shape: CircleBorder(),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        height: 65,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: (){
                setState(() => _selected_items = 0);
              },
              icon: Icon(Icons.dashboard_rounded, size: 30),
            ),
            IconButton(
              onPressed: (){
                setState(() => _selected_items = 1);
              },
              icon: Icon(Icons.monetization_on, size: 30,),
            ),

            SizedBox(width: 30,),

            IconButton(
              onPressed: (){
                setState(() => _selected_items = 3);
              },
              icon: Icon(Icons.savings, size: 30,),
            ),
            IconButton(
              onPressed: (){
                setState(() => _selected_items = 4);
              },
              icon: Icon(Icons.history, size: 30,),
            ),
          ],
        ),
      ),
    );
  }
}
