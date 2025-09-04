import 'package:flutter/material.dart';

class ProgressHeader extends StatelessWidget {
  final int completedTasks;
  final int totalTasks;
  final int percentage;

  const ProgressHeader({
    super.key,
    required this.completedTasks,
    required this.totalTasks,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Progress',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade800,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              '$completedTasks of $totalTasks task completed',
              style: TextStyle(
                fontSize: 12, 
                color: Colors.grey.shade600
              ),
            ),
          ],
        ),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.blue.shade600,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '$percentage %',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
