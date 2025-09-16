import 'package:logger/web.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthException implements Exception {
  final String message;
  final String code;
  
  const AuthException(this.message, this.code);
  
  @override
  String toString() => message;
}

class InvalidCredentialsException extends AuthException {
  const InvalidCredentialsException() : super(
    'Invalid email or password. Please check your credentials and try again.',
    'invalid-credentials'
  );
}

class NetworkException extends AuthException {
  const NetworkException() : super(
    'No internet connection. Please check your network and try again.',
    'network-error'
  );
}

class UserNotFoundException extends AuthException {
  const UserNotFoundException() : super(
    'No account found with this email address.',
    'user-not-found'
  );
}

class TooManyAttemptsException extends AuthException {
  const TooManyAttemptsException() : super(
    'Too many failed attempts. Please try again later.',
    'too-many-attempts'
  );
}

class WeakPasswordException extends AuthException {
  const WeakPasswordException() : super(
    'Password is too weak. Please use at least 8 characters with letters and numbers.',
    'weak-password'
  );
}

class EmailAlreadyInUseException extends AuthException {
  const EmailAlreadyInUseException() : super(
    'An account with this email already exists.',
    'email-already-in-use'
  );
}

class AnonymousSignInException extends AuthException {
  const AnonymousSignInException() : super(
    'Anonymous sign-in is not allowed. Please sign in with an email and password.',
    'anonymous-sign-in',
  );
}

class UserAlreadyRegisteredException extends AuthException {
  const UserAlreadyRegisteredException() : super(
    'User is already registered',
    'user-already-exists',
  );
}


class AuthErrorMapper {
  static AuthException mapError(dynamic error) {
    Logger().e(error.message.toString());
    // Already user-friendly
    if (error is AuthException) {
      return error;
    }

    // Handle Supabase errors
    if (error is AuthApiException) {
      final msg = error.message.toLowerCase();
      
      if (msg.contains('invalid login credentials')) {
        return const InvalidCredentialsException();
      }
      if (msg.contains('user not found')) {
        return const UserNotFoundException();
      }
      if (msg.contains('too many requests')) {
        return const TooManyAttemptsException();
      }
      if (msg.contains('weak password')) {
        return const WeakPasswordException();
      }
      if (msg.contains('email already registered')) {
        return const EmailAlreadyInUseException();
      }
      if(msg.contains('anonymous sign-ins are disabled')) {
        return const AnonymousSignInException();
      }
      if(msg.contains('user already registered')) {
        return const UserAlreadyRegisteredException();
      }
    }

    // Handle network errors
    final errorStr = error.toString().toLowerCase();
    if (errorStr.contains('network') ||
        errorStr.contains('socketexception') ||
        errorStr.contains('connection') ||
        errorStr.contains('timeout')) {
      return const NetworkException();
    }

    // Fallback
    return const AuthException(
      'Something went wrong. Please try again later.',
      'unknown-error',
    );
  }
}