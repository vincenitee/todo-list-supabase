import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_list_supabase/models/task.dart';
import 'package:todo_list_supabase/providers/task_repository_provider.dart';
import 'package:todo_list_supabase/repositories/task_repository.dart';

part 'task_provider.g.dart';

@riverpod
class TaskNotifier extends _$TaskNotifier {
  late final TaskRepository _taskRepository;

  @override
  FutureOr<List<Task>?> build() async {
    try {
      _taskRepository = ref.read(taskRepositoryProvider);
      final tasks = await _taskRepository.getTaskForAuthUser();
      return _sortTaskByStatusAndDate(tasks);
    } catch (e, st) {
      state = AsyncError(e, st);
      return [];
    }
  }

  // Add new Task
  Future<void> addTask(Task task) async {
    // Keep the previous list of tasks
    final previousTasks = state.value ?? [];

    state = AsyncValue.loading();

    try {
      final newTask = await _taskRepository.addTask(task);

      Logger().d('New Task added: $newTask');

      if (newTask != null) {
        state = AsyncValue.data(_sortTaskByStatusAndDate([...previousTasks, newTask]));
      } else {
        state = AsyncValue.data(previousTasks);
      }
    } catch (e, st) {
      Logger().e(e);
      Logger().t(st);
      state = AsyncValue.data(previousTasks);
    }
  }

  // Toggle task status
  Future<void> toggleTask(Task task) async {
    final previousTasks = state.value ?? [];

    state = AsyncValue.loading();

    try {
      // Toggle the task status
      final toggledTask = await _taskRepository.toggleTaskStatus(task);

      // Check if it is not null
      if (toggledTask == null) {
        Logger().e('Failed to toggle task status: Task: $toggledTask');
        state = AsyncValue.data(_sortTaskByStatusAndDate(previousTasks));
        return;
      }

      // Update the tasks in the state
      final updatedTasks = previousTasks.map((task) {
        // Replace the previous task with the toggled task
        if (task.id == toggledTask.id) {
          return toggledTask;
        }
        return task;
      }).toList();

      // Insert the updated task in the state
      state = AsyncValue.data(_sortTaskByStatusAndDate(updatedTasks));
    } catch (e, st) {
      Logger().e(e);
      Logger().t(st);
    }
  }

  // Delete Task
  // TODO: IMPLEMENT THE deleteTask METHOD

  List<Task> _sortTaskByStatusAndDate(List<Task> tasks) {
    tasks.sort((a, b) {
      // 1. Sort by status first (incomplete before complete)
      if (a.isDone != b.isDone) {
        return a.isDone ? 1 : -1;
      }

      // 2. If both have the same status, sort by createdAt
      final aDate = a.createdAt;
      final bDate = b.createdAt;

      if (aDate == null && bDate == null) return 0;
      if (aDate == null) return 1; // null goes last
      if (bDate == null) return -1; // null goes last

      // newest first
      return bDate.compareTo(aDate);
      // oldest first:
      // return aDate.compareTo(bDate);
    });
    return tasks;
  }
}
