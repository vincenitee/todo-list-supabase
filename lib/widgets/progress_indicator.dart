import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  final int percentage;

  const CustomProgressIndicator({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: LinearProgressIndicator(
        value: percentage / 100,
        backgroundColor: Colors.grey.shade200,
        valueColor: AlwaysStoppedAnimation<Color>(
          percentage == 100 ? Colors.green.shade600 : Colors.blue.shade600,
        ),
      ),
    );
  }
}
