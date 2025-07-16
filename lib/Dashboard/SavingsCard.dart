import 'package:flutter/material.dart';

class SavingsCard extends StatelessWidget {
  final double amount;
  Color? color;

  SavingsCard({super.key, required this.amount}){
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
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            color: Colors.teal[100],
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Container(
              padding: EdgeInsets.all(20),
              height: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Savings',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          Text(
                            '20% of your budget',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'P $amount',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: color
                        ),
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'P 50,000.00',
                        style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        'Your total savings as of July',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]);
  }
}
