import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_supabase/providers/task_provider.dart';
import 'package:todo_list_supabase/widgets/stats_card.dart';

class StatSection extends ConsumerWidget {
  const StatSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskStats = ref.watch(taskStatsProvider);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Task Statistics',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: StatsCard(
                  title: 'Total Tasks',
                  value: taskStats.total.toString(),
                  icon: Icons.assignment,
                  color: Colors.blue,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: StatsCard(
                  title: 'Completed',
                  value: taskStats.completed.toString(),
                  icon: Icons.check_circle,
                  color: Colors.green,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: StatsCard(
                  title: 'Pending',
                  value: taskStats.pending.toString(),
                  icon: Icons.pending,
                  color: Colors.orange,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: StatsCard(
                  title: 'Completion Rate',
                  value: '${taskStats.completionRate}%',
                  icon: Icons.trending_up,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
