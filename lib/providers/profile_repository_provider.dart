import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_list_supabase/providers/supabase_client_provider.dart';
import 'package:todo_list_supabase/repositories/profile_repository.dart';

part 'profile_repository_provider.g.dart';

@riverpod
ProfileRepository profileRepository (Ref ref) {
  final client = ref.read(supabaseClientProvider);
  return ProfileRepository(client);
}