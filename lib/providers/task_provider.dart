import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_list_supabase/models/task.dart';
import 'package:todo_list_supabase/providers/task_repository_provider.dart';
import 'package:todo_list_supabase/repositories/task_repository.dart';

part 'task_provider.g.dart';

@riverpod
class TaskNotifier extends _$TaskNotifier {
  final Logger _log = Logger();

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
      if (newTask == null) {
        state = AsyncValue.data([...previousTasks, newTask!]);
      } else {
        state = AsyncValue.data(previousTasks);
      }
    } catch (e, st) {
      _log.e(e);
      _log.t(st);
      state = AsyncValue.data(previousTasks);
    }
  }

  // Toggle task status

  // Delete Task
}
