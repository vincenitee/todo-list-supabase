import 'package:flutter/material.dart';
import 'package:todo_list_supabase/models/task.dart';
import 'package:todo_list_supabase/widgets/no_task_yet.dart';
import 'package:todo_list_supabase/widgets/task_item.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final void Function(Task) onTaskTap;
  const TaskList({super.key, required this.tasks, required this.onTaskTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: tasks.isEmpty
          ? NoTaskYet()
          : ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
            return TaskItem(task: tasks[index], onTap: onTaskTap);
          }),
    );
  }
}
