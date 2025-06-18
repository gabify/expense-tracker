import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        backgroundColor: Colors.lightBlue[700],
      ),
      body: Column(
        children: [
          Text('Text 1'),
          Text('Text 2'),
          Text('Text 3'),
        ]
      )
    ),
  ));
}

