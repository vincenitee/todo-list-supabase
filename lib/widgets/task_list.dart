import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:todo_list_supabase/providers/task_provider.dart';
import 'package:todo_list_supabase/widgets/no_task_yet.dart';
import 'package:todo_list_supabase/widgets/task_item.dart';

class TaskList extends ConsumerWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskState = ref.watch(taskNotifierProvider);
    final taskNotifier = ref.read(taskNotifierProvider.notifier);

    return taskState.when(
      data: (tasks) {
        if (tasks.isEmpty) {
          return const NoTaskYet();
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return TaskItem(
              task: task,
              onTap: (task) {
                taskNotifier.toggleTask(task);
                Fluttertoast.showToast(
                  msg: task.isDone
                      ? 'Task marked as pending'
                      : 'Task marked as completed',
                  gravity: ToastGravity.BOTTOM_RIGHT,
                );
              },
            );
          },
        );
      },
      error: (_, _) {
        return Center(child: Text('Something went wrong!'));
      },
      loading: () {
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Updating tasks...'),
            ],
          ),
        );
      },
    );
  }
}
