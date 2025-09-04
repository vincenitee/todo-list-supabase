import 'package:flutter/material.dart';

class TaskListHeader extends StatelessWidget {
  final int tasksCount;

  const TaskListHeader({super.key, required this.tasksCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Tasks',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade800,
          ),
        ),
        if (tasksCount > 0)
          Text(
            '$tasksCount ${tasksCount == 1 ? 'task' : 'tasks'}',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
          ),
      ],
    );
  }
}
