import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_list_supabase/models/task.dart';

class TaskRepository {
  final SupabaseClient client;

  TaskRepository(this.client);

  // Fetches tasks based on the user
  Future<List<Task>> getTask(String userId) async {
    // Fetches tasks
    final response = await client.from('tasks').select().eq('user_id', userId);

    // Make sure that it is a List of Maps
    final data = response as List;

    // Map data to list of Task
    return data.map((json) => Task.fromMap(json)).toList();
  }

  // Inserts task
  Future<Task?> addTask(Task task) async {
    final response = await client
        .from('tasks')
        .insert(task.toMap())
        .select()
        .single();

    return Task.fromMap(response);
  }

  // Toggle task status
  Future<Task?> toggleTaskStatus(Task task) async {
    final response = await client
        .from('tasks')
        .update({'done': !task.isDone})
        .eq('id', task.id)
        .select()
        .single();

    return Task.fromMap(response);
  }

  // Deletes a task
  Future<void> deleteTask(int id) async {
    await client.from('tasks').delete().eq('id', id);
  }
}
