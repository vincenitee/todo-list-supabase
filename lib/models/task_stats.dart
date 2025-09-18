import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list_supabase/models/task.dart';

part 'task_stats.freezed.dart';

@freezed
abstract class TaskStats with _$TaskStats {
  const factory TaskStats({
    required int total,
    required int completed,
    required int pending,
    required int completionRate,
  }) = _TaskStats;

  factory TaskStats.empty() => const TaskStats(
    total: 0,
    completed: 0,
    pending: 0,
    completionRate: 0,
  );

  factory TaskStats.fromTasks(List<Task> tasks) {
    final total = tasks.length;
    final completed = tasks.where((task) => task.isDone).length;
    final pending = total - completed;
    final completionRate = total == 0 ? 0 : ((completed / total) * 100).toInt();

    return TaskStats(
      total: total,
      completed: completed,
      pending: pending,
      completionRate: completionRate,
    );
  }
}
