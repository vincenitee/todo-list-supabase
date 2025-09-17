import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_list_supabase/models/task.dart';

class TaskRepository {

  final SupabaseClient client;

  TaskRepository(this.client);

  // Fetches tasks based on the currently authenticated user
  Future<List<Task>> getTaskForAuthUser() async {
    final user = await client.auth.getUser();
    return getTasksByUserId(user.user!.id);
  }

  // Fetches tasks based on the userId
  Future<List<Task>> getTasksByUserId(String userId) async {
    Logger().d('Authenticated User ID: $userId');

    try {
      // Fetches tasks
      final response = await client
          .from('tasks')
          .select()
          .eq('user_id', userId);

      
      // Make sure that it is a List of Maps
      final data = response as List;

      // Map data to list of Task
      final tasks = data.map((json) => Task.fromJson(json)).toList();
      return tasks;
    } catch (e) {
      rethrow;
    }
  }

  // Inserts task
  Future<Task?> addTask(Task task) async {
    try {
      final response = await client
          .from('tasks')
          .insert(task.toJson())
          .select()
          .single();

      final newTask = response.isNotEmpty ? Task.fromJson(response) : null;

      return newTask;
    } catch (e, st) {
      Logger().e('Failed to add task: $e/n$st');
      rethrow;
    }
  }

  // Toggle task status
  Future<Task?> toggleTaskStatus(Task task) async {
    if(task.id == null) {
      throw ArgumentError('Task id cannot be null');
    }

    try {
      final response = await client
          .from('tasks')
          .update({'done': !task.isDone})
          .eq('id', task.id!)
          .select()
          .single();

      return Task.fromJson(response);

    } catch (e, st) {
      Logger().e('Failed to toggle task status: $e/n$st');
      rethrow;
    }
  }

  // Deletes a task
  Future<void> deleteTask(int id) async {
    try {
      await client.from('tasks').delete().eq('id', id);
    } catch (e) {
      rethrow;
    }
  }
}
