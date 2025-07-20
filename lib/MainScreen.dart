import 'package:expense_tracker/Savings/SavingsDashboard.dart';
import 'package:flutter/material.dart';

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
