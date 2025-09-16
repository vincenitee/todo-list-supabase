import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_list_supabase/providers/auth_repository_provider.dart';
import 'package:todo_list_supabase/repositories/auth_repository.dart';
import 'package:todo_list_supabase/exceptions/auth_exceptions.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  late final AuthRepository _repository;

  // Gets the current user if exists
  @override
  Stream<AuthState> build() {
    _repository = ref.read(authRepositoryProvider);
    return _repository.authStateChanges;
  }

  // Sign In - now called by AuthForm
  Future<void> signIn(String email, String password) async {
    try {
      await _repository.signIn(email, password);
    } catch (error) {
      final friendlyError = AuthErrorMapper.mapError(error);
      state = AsyncValue.error(friendlyError, StackTrace.current);
      rethrow; // Re-throw so AuthForm can handle the error in its own state
    }
  }

  // Sign Out
  Future<void> signOut() async {
    try {
      await _repository.signOut();
    } catch (error) {
      final friendlyError = AuthErrorMapper.mapError(error);
      state = AsyncValue.error(friendlyError, StackTrace.current);
      rethrow;
    }
  }

  // Sign Up - now called by AuthForm
  Future<void> signup(String email, String username, String password) async {
    try {
      await _repository.signUp(email, username, password);
    } catch (error) {
      final friendlyError = AuthErrorMapper.mapError(error);
      state = AsyncValue.error(friendlyError, StackTrace.current);
      rethrow; // Re-throw so AuthForm can handle the error in its own state
    }
  }

  // Update Profile - now called by AuthForm
  Future<void> updateProfile(
    String email,
    String username,
    String password,
  ) async {

    try {
      await _repository.updateInformation(
        email,
        username,
        password,
      );
    } catch (error) {
      final friendlyError = AuthErrorMapper.mapError(error);
      state = AsyncValue.error(friendlyError, StackTrace.current);
      rethrow; // Re-throw so AuthForm can handle the error in its own state
    }
  }
}