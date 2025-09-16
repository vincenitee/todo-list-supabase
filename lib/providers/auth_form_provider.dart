import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_list_supabase/exceptions/auth_exceptions.dart';
import 'package:todo_list_supabase/models/auth_form_state.dart';
import 'package:todo_list_supabase/providers/auth_provider.dart';

part 'auth_form_provider.g.dart';

@riverpod
class AuthForm extends _$AuthForm {
  @override
  AuthFormState build(String type) {
    return const AuthFormState();
  }

  // Form field updates
  void updateEmail(String email) {
    state = state.copyWith(email: email, errorMessage: null);
  }

  void updateUsername(String username) {
    state = state.copyWith(username: username, errorMessage: null);
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password, errorMessage: null);
  }

  void updateConfirmPassword(String confirmPassword) {
    state = state.copyWith(
      confirmPassword: confirmPassword,
      errorMessage: null,
    );
  }

  void togglePasswordVisibility(bool obscurePassword) {
    state = state.copyWith(obscurePassword: !obscurePassword);
  }

  void toggleConfirmPasswordVisibility(bool obscureConfirmPassword) {
    state = state.copyWith(obscureConfirmPassword: !obscureConfirmPassword);
  }

  void clearError() {
    state = state.copyWith(errorMessage: null);
  }

  void clearSuccess() {
    state = state.copyWith(successMessage: null);
  }

  Future<void> submitLogin() async {
    if (!_validateLogin()) return;

    state = state.copyWith(isLoading: true);

    try {
      // Use your existing AuthNotifier for actual authentication
      await ref
          .read(authNotifierProvider.notifier)
          .signIn(state.email, state.password);

      // Check if authentication was successful
      final authState = ref.read(authNotifierProvider);
      if (authState.hasValue && authState.value != null) {
        state = state.copyWith(
          isLoading: false,
          successMessage: 'Login successful!',
        );
      }

      // Resets the form state
      reset();
    } catch (error) {
      final friendlyError = AuthErrorMapper.mapError(error);
      state = state.copyWith(
        isLoading: false,
        errorMessage: friendlyError.message,
      );
    }
  }

  Future<void> submitSignup() async {
    if (!_validateSignup()) return;

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      await ref
          .read(authNotifierProvider.notifier)
          .signup(state.email, state.username, state.password);

      // Check if signup was successful
      final authState = ref.read(authNotifierProvider);
      if (authState.hasValue && authState.value != null) {
        state = state.copyWith(
          isLoading: false,
          successMessage: 'Signup successful!',
        );
      }

      reset();
    } catch (error) {
      final friendlyError = AuthErrorMapper.mapError(error);
      state = state.copyWith(
        isLoading: false,
        errorMessage: friendlyError.message,
      );
    }
  }

  Future<void> submitProfileUpdate() async {
    if (!_validateProfileUpdate()) return;

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      await ref
          .read(authNotifierProvider.notifier)
          .updateProfile(state.email, state.username, state.password);

      state = state.copyWith(
        isLoading: false,
        successMessage: 'Profile updated successfully!',
      );
    } catch (error) {
      state = state.copyWith(isLoading: false, errorMessage: error.toString());
    }
  }

  bool _validateLogin() {
    bool isLoginValid = true;

    // Reset errors before validating
    state = state.copyWith(emailError: null, passwordError: null);

    if (state.email.isEmpty) {
      state = state.copyWith(emailError: 'Email is required');
      isLoginValid = false;
    } else if (!_isValidEmail(state.email)) {
      state = state.copyWith(emailError: 'Please enter a valid email');
      isLoginValid = false;
    }

    if (state.password.isEmpty) {
      state = state.copyWith(passwordError: 'Password is required');
      isLoginValid = false;
    }

    return isLoginValid;
  }

  bool _validateSignup() {
    bool isSignupValid = true;

    // Reset errors before validating
    state = state.copyWith(
      emailError: null,
      usernameError: null,
      passwordError: null,
      confirmPasswordError: null,
    );

    if (state.email.isEmpty) {
      state = state.copyWith(emailError: 'Email is required');
      isSignupValid = false;
    } else if (!_isValidEmail(state.email)) {
      state = state.copyWith(emailError: 'Please enter a valid email');
      isSignupValid = false;
    }

    if (state.username.isEmpty) {
      state = state.copyWith(usernameError: 'Username is required');
      isSignupValid = false;
    } else if (state.username.length < 3) {
      state = state.copyWith(
        usernameError: 'Username must be at least 3 characters',
      );
      isSignupValid = false;
    }

    if (state.password.isEmpty) {
      state = state.copyWith(passwordError: 'Password is required');
      isSignupValid = false;
    } else if (state.password.length < 6) {
      state = state.copyWith(
        passwordError: 'Password must be at least 6 characters',
      );
      isSignupValid = false;
    }

    if (state.confirmPassword.isEmpty) {
      state = state.copyWith(
        confirmPasswordError: 'Please confirm your password',
      );
      isSignupValid = false;
    } else if (state.password != state.confirmPassword) {
      state = state.copyWith(confirmPasswordError: 'Passwords do not match');
      isSignupValid = false;
    }

    return isSignupValid;
  }

  bool _validateProfileUpdate() {
    if (state.email.isEmpty) {
      state = state.copyWith(emailError: 'Email is required');
      return false;
    }
    if (state.username.isEmpty) {
      state = state.copyWith(usernameError: 'Username is required');
      return false;
    }
    if (!_isValidEmail(state.email)) {
      state = state.copyWith(emailError: 'Please enter a valid email');
      return false;
    }
    // Password is optional for profile update
    if (state.password.isNotEmpty && state.password.length < 6) {
      state = state.copyWith(
        passwordError: 'Password must be at least 6 characters',
      );
      return false;
    }
    return true;
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

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
