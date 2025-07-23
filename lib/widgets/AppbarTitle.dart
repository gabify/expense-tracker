import 'package:flutter/material.dart';

class AppbarTitle extends StatelessWidget {
  final String text;
  const AppbarTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 1),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Colors.teal,
                  width: 2
              )
          )
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}
