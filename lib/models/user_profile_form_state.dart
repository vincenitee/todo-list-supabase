import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_form_state.freezed.dart';

@freezed
abstract class UserProfileFormState with _$UserProfileFormState{
  const factory UserProfileFormState({
    @Default('') String username,
    @Default('') String password,
    @Default(false) bool isLoading,
    String? successMessage,
    String? errorMessage,
    String? usernameError,
    String? passwordError,
  }) = _UserProfileFormState;
}