import 'package:flutter/material.dart';

class ExpenseDashboardCard extends StatelessWidget {
  final String category;
  final double amount;
  final int percentage;
  Color? color;

  ExpenseDashboardCard({
    super.key,
    required this.category,
    required this.amount,
    required this.percentage,
  }){
    if(amount <= 1000.0 && amount >= 500.0){
      color = Colors.yellow[800];
    } else if(amount < 500.0){
      color = Colors.red[500];
    }else{
      color = Colors.green[500];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.teal[50],
      child: Container(
        padding: EdgeInsets.all(16),
        height: 150,
        width: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${category}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17
                  ),
                ),
                Text('${percentage}% of your budget')
              ],
            ),

            Text(
              'P ${amount}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: color
              ),
            )
          ],
        ),
      ),
    );
  }
}
