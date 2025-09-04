import 'package:flutter/material.dart';
import 'package:todo_list_supabase/models/task.dart';
import 'package:todo_list_supabase/widgets/progress_header.dart';
import 'package:todo_list_supabase/widgets/progress_indicator.dart';

class ProgressCard extends StatelessWidget {
  final List<Task> tasks;

  const ProgressCard({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    final int completedTasks = tasks.where((task) => task.isDone).length;
    final int totalTasks = tasks.length;
    final int percentage =
        (totalTasks > 0 ? (completedTasks / totalTasks) * 100 : 0.0).toInt();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: Column(
        children: [
          ProgressHeader(
            completedTasks: completedTasks,
            totalTasks: totalTasks,
            percentage: percentage,
          ),

          const SizedBox(height: 12),

          CustomProgressIndicator(percentage: percentage),
        ],
      ),
    );
  }
}
