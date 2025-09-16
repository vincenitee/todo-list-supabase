import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_list_supabase/providers/supabase_client_provider.dart';
import 'package:todo_list_supabase/repositories/task_repository.dart';

part 'task_repository_provider.g.dart';

@riverpod
TaskRepository taskRepository (Ref ref){
  // Fetches the supabase provider
  final client = ref.read(supabaseClientProvider);

  // Exposes the injected task repository to public
  return TaskRepository(client);
}