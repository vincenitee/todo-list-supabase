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
    } catch (error) {
      final friendlyError = _mapErrorToUserFriendly(error);
      state = AsyncValue.error(friendlyError, StackTrace.current);
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
      final updatedUser = await _repository.updateInformation(
        email,
        username,
        password,
      );

      state = AsyncValue.data(updatedUser);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Exception _mapErrorToUserFriendly(dynamic error) {
    if (error is AuthException) {
      // Already user-friendly, return as-is
      return error;
    }

    // Handle Supabase specific errors
    if (error is AuthApiException) {
      switch (error.message.toLowerCase()) {
        case String msg when msg.contains('invalid login credentials'):
          return const InvalidCredentialsException();
        case String msg when msg.contains('user not found'):
          return const UserNotFoundException();
        case String msg when msg.contains('too many requests'):
          return const TooManyAttemptsException();
        case String msg when msg.contains('weak password'):
          return const WeakPasswordException();
        case String msg when msg.contains('email already registered'):
          return const EmailAlreadyInUseException();
      }
    }

    // Handle network errors
    if (error.toString().contains('network') ||
        error.toString().contains('connection') ||
        error.toString().contains('timeout')) {
      return const NetworkException();
    }
    

    // Fallback for unknown errors
    return AuthException(
      'Something went wrong. Please try again later.',
      code: 'unknown-error',
    );
  }
}


class AuthException implements Exception {
  final String message;
  final String code;

  const AuthException(this.message, {this.code = 'unknown'});

  @override
  String toString() => message;
}

class InvalidCredentialsException extends AuthException {
  const InvalidCredentialsException() : super(
    'Invalid email or password. Please check your credentials and try again.',
    code: 'invalid-credentials'
  );
}

class NetworkException extends AuthException {
  const NetworkException() : super(
    'No internet connection. Please check your network and try again.',
    code: 'network-error'
  );
}

class UserNotFoundException extends AuthException {
  const UserNotFoundException() : super(
    'No account found with this email address.',
    code: 'user-not-found'
  );
}

class TooManyAttemptsException extends AuthException {
  const TooManyAttemptsException() : super(
    'Too many failed attempts. Please try again later.',
    code: 'too-many-attempts'
  );
}

class WeakPasswordException extends AuthException {
  const WeakPasswordException() : super(
    'Password is too weak. Please use at least 8 characters with letters and numbers.',
    code: 'weak-password'
  );
}

class EmailAlreadyInUseException extends AuthException {
  const EmailAlreadyInUseException() : super(
    'An account with this email already exists.',
    code: 'email-already-in-use'
  );
}
