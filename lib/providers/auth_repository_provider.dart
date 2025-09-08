import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_list_supabase/providers/supabase_client_provider.dart';
import 'package:todo_list_supabase/repositories/auth_repository.dart';

part 'auth_repository_provider.g.dart';

// Injects supabase dependency
@riverpod
AuthRepository authRepository(Ref ref) {
  final client = ref.read(supabaseClientProvider);
  return AuthRepository(client);
}