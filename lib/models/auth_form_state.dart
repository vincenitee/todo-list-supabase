import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_form_state.freezed.dart';

@freezed
abstract class AuthFormState with _$AuthFormState {
  const factory AuthFormState({
    @Default('') String email,
    @Default('') String username,
    @Default('') String password,
    @Default('') String confirmPassword,
    @Default(false) bool isLoading,
    @Default(false) bool obscurePassword,
    @Default(false) bool obscureConfirmPassword,
    String? successMessage,
    String? errorMessage,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
    String? usernameError,
  }) = _AuthFormState;
}


