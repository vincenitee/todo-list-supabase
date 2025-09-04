import 'package:flutter/material.dart';
import 'package:todo_list_supabase/models/task.dart';
import 'package:todo_list_supabase/utils/app_date_utils.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final double verticalMargin;
  final void Function(Task) onTap;
  const TaskItem({
    super.key,
    required this.task,
    this.verticalMargin = 3,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final IconData icon = task.isDone
        ? Icons.check_circle
        : Icons.radio_button_unchecked;

    final Color iconColor = task.isDone ? Colors.blue.shade700 : Colors.grey;

    final Color tileColor = task.isDone
        ? Colors.lightBlue.shade50
        : Colors.grey.shade50;

    final String subtitle = task.isDone ? 'Completed' : 'Pending';

    return Container(
      margin: EdgeInsets.symmetric(vertical: verticalMargin),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(5),
        ),
        leading: Icon(icon, color: iconColor),
        title: Text(task.title),
        trailing: Text(
          AppDateUtils.formatTime(task.createdAt),
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        tileColor: tileColor,
        subtitle: Text(subtitle),
        onTap: () => onTap(task),
      ),
    );
  }
}
