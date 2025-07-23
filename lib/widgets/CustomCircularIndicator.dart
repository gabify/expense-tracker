import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CustomCircularIndicator extends StatelessWidget {
  final double percent;
  final Icon icon;
  final String amount;
  final String limit;
  Color? progressColor;

  CustomCircularIndicator({
    super.key,
    required this.percent,
    required this.icon,
    required this.amount,
    required this.limit,
    this.progressColor
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 120,
      progressColor: progressColor,
      percent: percent,
      animation: true,
      backgroundWidth: 14,
      lineWidth: 14,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(height: 10,),
          Text(
            amount,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'of $limit',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
