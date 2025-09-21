import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_list_supabase/models/user_profile_form_state.dart';

part 'user_profile_form_provider.g.dart';

@riverpod
class UserProfileForm extends _$UserProfileForm {
  @override
  UserProfileFormState build() {
    return const UserProfileFormState();
  }

  // --------------------
  // Field updates
  // --------------------
  void updateUsername(String username) {
    state = state.copyWith(username: username, usernameError: null);
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password, passwordError: null);
  }

  void clearError() {
    state = state.copyWith(errorMessage: null);
  }

  void clearSuccess() {
    state = state.copyWith(successMessage: null);
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  // --------------------
  // Validation helpers
  // --------------------
  bool validate() {
    bool isUserProfileValid = true;

    if (state.username.isEmpty && state.password.isEmpty) {
      state = state.copyWith(
        errorMessage: 'Please provide at least one field to update',
      );
      isUserProfileValid = false;
    }

    if (state.username.isNotEmpty && state.username.length < 3) {
      state = state.copyWith(
        usernameError: 'Username must be at least 3 characters long',
      );
      isUserProfileValid = false;
    }

    if (state.password.isNotEmpty && state.password.length < 6) {
      state = state.copyWith(
        passwordError: 'Password must be at least 6 characters long',
      );
      isUserProfileValid = false;
    }

    return isUserProfileValid;
  }

  // --------------------
  // Utils
  // --------------------
  void reset () {
    state = UserProfileFormState();
  }
}
