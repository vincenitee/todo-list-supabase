import 'package:logger/web.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_list_supabase/exceptions/auth_exceptions.dart';
import 'package:todo_list_supabase/models/auth_form_state.dart';
import 'package:todo_list_supabase/providers/auth_repository_provider.dart';
import 'package:todo_list_supabase/repositories/auth_repository.dart';

part 'auth_form_provider.g.dart';

@riverpod
class AuthForm extends _$AuthForm {

  @override
  AuthFormState build(String type) {
    return const AuthFormState();
  }

  AuthRepository get _authRepository => ref.read(authRepositoryProvider);

  // --------------------
  // Field updates
  // --------------------
  void updateEmail(String email) {
    state = state.copyWith(email: email, emailError: null);
  }

  void updateUsername(String username) {
    state = state.copyWith(username: username, usernameError: null);
  }

  void updatePhone(String phone) {
    state = state.copyWith(phone: phone, phoneError: null);
  }

  void updateOTP(String otp) {
    state = state.copyWith(otp: otp, otpError: null);
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password, passwordError: null);
  }

  void updateConfirmPassword(String confirmPassword) {
    state = state.copyWith(
      confirmPassword: confirmPassword,
      confirmPasswordError: null,
    );
  }

  void togglePasswordVisibility() {
    state = state.copyWith(obscurePassword: !state.obscurePassword);
  }

  void toggleConfirmPasswordVisibility() {
    state =
        state.copyWith(obscureConfirmPassword: !state.obscureConfirmPassword);
  }

  void clearError() {
    state = state.copyWith(errorMessage: null);
  }

  void clearSuccess() {
    state = state.copyWith(successMessage: null);
  }

  // --------------------
  // Form submissions
  // --------------------
  Future<void> submitLogin() async {
    if (!_validateLogin()) return;

    state = state.copyWith(isLoading: true);

    try {
      await _authRepository.signIn(state.email, state.password);

      state = state.copyWith(
        isLoading: false,
        successMessage: 'Login successful!',
      );
    } catch (error) {
      final friendlyError = AuthErrorMapper.mapError(error);
      state = state.copyWith(
        isLoading: false,
        errorMessage: friendlyError.message,
      );
    }
  }

  Future<void> submitEmailSignup() async {
    if (!_validateSignup()) return;

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final response = await _authRepository.signUpWithEmail(
        state.email,
        state.username,
        state.password,
      );

      Logger().d('Current session after signup: $response');

      final session = response.session;

      if (session == null) {
        // No session means email verification required
        state = state.copyWith(
          isLoading: false,
          successMessage: 'Signup successful! Please verify your email.',
          navigateToVerification: true,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          successMessage: 'Signup successful!',
        );
      }
    } catch (error) {
      final friendlyError = AuthErrorMapper.mapError(error);
      state = state.copyWith(
        isLoading: false,
        errorMessage: friendlyError.message,
      );
    }
  }

  // --------------------
  // Validation helpers
  // --------------------
  bool _validateLogin() {
    bool isValid = true;
    state = state.copyWith(emailError: null, passwordError: null);

    if (state.email.isEmpty) {
      state = state.copyWith(emailError: 'Email is required');
      isValid = false;
    } else if (!_isValidEmail(state.email)) {
      state = state.copyWith(emailError: 'Please enter a valid email');
      isValid = false;
    }

    if (state.password.isEmpty) {
      state = state.copyWith(passwordError: 'Password is required');
      isValid = false;
    }

    return isValid;
  }

  bool _validateSignup() {
    bool isValid = true;
    state = state.copyWith(
      emailError: null,
      usernameError: null,
      phoneError: null,
      passwordError: null,
      confirmPasswordError: null,
    );

    if (state.email.isEmpty) {
      state = state.copyWith(emailError: 'Email is required');
      isValid = false;
    } else if (!_isValidEmail(state.email)) {
      state = state.copyWith(emailError: 'Please enter a valid email');
      isValid = false;
    }

    if (state.username.isEmpty) {
      state = state.copyWith(usernameError: 'Username is required');
      isValid = false;
    } else if (state.username.length < 3) {
      state = state.copyWith(
        usernameError: 'Username must be at least 3 characters',
      );
      isValid = false;
    }

    if (state.password.isEmpty) {
      state = state.copyWith(passwordError: 'Password is required');
      isValid = false;
    } else if (state.password.length < 6) {
      state = state.copyWith(
        passwordError: 'Password must be at least 6 characters',
      );
      isValid = false;
    }

    if (state.confirmPassword.isEmpty) {
      state =
          state.copyWith(confirmPasswordError: 'Please confirm your password');
      isValid = false;
    } else if (state.password != state.confirmPassword) {
      state = state.copyWith(confirmPasswordError: 'Passwords do not match');
      isValid = false;
    }

    return isValid;
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  // --------------------
  // Utilities
  // --------------------
  void reset() {
    state = const AuthFormState();
  }

  void prefillForm({String? email, String? username}) {
    state = state.copyWith(
      email: email ?? state.email,
      username: username ?? state.username,
    );
  }
}
