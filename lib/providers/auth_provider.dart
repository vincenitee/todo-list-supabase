import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_list_supabase/providers/auth_repository_provider.dart';
import 'package:todo_list_supabase/repositories/auth_repository.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  late final AuthRepository _repository;

  // Injects
  @override
  FutureOr<User?> build() {
    _repository = ref.read(authRepositoryProvider);
    return _repository.getCurrentUser();
  }

  // Sign In
  Future<void> signIn(String email, String password) async {
    // Sets to loading state
    state = AsyncValue.loading();

    try {
      final response = await _repository.signIn(email, password);
      final user = response.user;

      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  // Sign Out
  Future<void> signOut() async {
    state = AsyncValue.loading();

    try {
      await _repository.signOut();
      state = AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  // Update Profile
  Future<void> updateProfile(
    String email,
    String username,
    String password,
  ) async {
    state = AsyncValue.loading();

    try {
      final updatedUser = await _repository.updateInformation(email, username, password);

      state = AsyncValue.data(updatedUser);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
