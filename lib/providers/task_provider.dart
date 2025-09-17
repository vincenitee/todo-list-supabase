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
      return tasks;
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
        state = AsyncValue.data([...previousTasks, newTask]);
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
  // TODO: IMPLEMENT THE toggleTaskStatus METHOD
  Future<void> toggleTask(Task task) async{
    final previousTasks = state.value ?? [];

    state = AsyncValue.loading();

    try {
      // Toggle the task status
      final toggledTask = await _taskRepository.toggleTaskStatus(task);

      // Check if it is not null
      if(toggledTask == null) {
        Logger().e('Failed to toggle task status: Task: $toggledTask');
        state = AsyncValue.data(previousTasks);
        return;
      }

      // Update the tasks in the state
      final updatedTasks = previousTasks.map((task) {
        // Replace the previous task with the toggled task
        if(task.id == toggledTask.id) {
          return toggledTask;
        }
        return task;
      }).toList();

      // Insert the updated task in the state
      state = AsyncValue.data(updatedTasks);
    } catch (e, st) {
      Logger().e(e);
      Logger().t(st);
    }
  }

  // Delete Task
  // TODO: IMPLEMENT THE deleteTask METHOD
}
