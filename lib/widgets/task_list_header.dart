import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_supabase/providers/task_provider.dart';

class TaskListHeader extends ConsumerWidget {
  const TaskListHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksCount = ref.watch(taskNotifierProvider).value?.length ?? 0;

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
