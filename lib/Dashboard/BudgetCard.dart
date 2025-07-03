import 'package:flutter/material.dart';

class BudgetCard extends StatelessWidget {
  const BudgetCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
    Card(
    color: Colors.teal[100],
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.all(20),
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'As of July 2025',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w700
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'P 20,000.00',
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'Your budget for this month',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Some text to add later'),
                ElevatedButton(
                  onPressed: (){},
                  child: Row(
                    children: [
                      Icon(Icons.create),
                      SizedBox(width: 4.8,),
                      Text('Edit Budget')
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[800],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.vertical(
                              top: Radius.circular(7),
                              bottom: Radius.circular(7)
                          )
                      )
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ),
  ]);
  }
}
