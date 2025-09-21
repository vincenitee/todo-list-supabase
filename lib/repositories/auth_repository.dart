import 'package:logger/web.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  final SupabaseClient client;

  AuthRepository(this.client);

  // Sign up
  Future<AuthResponse> signUpWithEmail(
    String email,
    String username,
    String password,
  ) async {
    try {
      final response = await client.auth.signUp(
        email: email,
        password: password,
        emailRedirectTo: 'myapp://callback',
        data: {'username': username},
      );

      final user = response.user;
      final session = response.session;

      if (user != null && session == null) {
        // waiting for verification
        Logger().d('User created, email verification pending: ${user.email}');
      }

      return response;
    } on AuthException {
      rethrow;
    } on PostgrestException catch (e) {
      throw Exception('Failed to create profile: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error during sign up: $e');
    }
  }

  // Signups with Phone Number
  Future<void> signupWithPhone(
    String phone,
    String username,
    String password,
  ) async {
    try {
      await client.auth.signUp(
        phone: phone,
        password: password,
        emailRedirectTo: 'myapp://callback',
        data: {'username': username},
      );

      // At this point the OTP was sent automatically
    } on AuthException {
      rethrow;
    } on PostgrestException catch (e) {
      Logger().e(e.message);
      throw Exception('failed to create profile: ${e.message}');
    } catch (e) {
      Logger().e(e);
      throw Exception('Unexpected error during signup: $e');
    }
  }

  // Verifies the OTP
  Future<void> verifyOtp(String email, String token) async {
    try {
      await client.auth.verifyOTP(
        type: OtpType.email,
        token: token,
        phone: email,
      );
    } on AuthException {
      rethrow;
    } catch (e) {
      Logger().e(e);
      throw Exception('Invalid or expired OTP: $e');
    }
  }

  // Sign in
  Future<AuthResponse> signIn(String email, String password) async {
    try {
      final response = await client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw AuthException('Sign in failed: No user returned');
      }

      return response;
    } on AuthException {
      rethrow;
    } catch (e) {
      throw Exception('Unexpected error during sign in: $e');
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await client.auth.signOut();
    } on AuthException {
      rethrow;
    } catch (e) {
      throw Exception('Unexpected error during sign out: $e');
    }
  }

  // Get the current user
  User? getCurrentUser() {
    return client.auth.currentUser;
  }

  // Get current session
  Session? getCurrentSession() {
    return client.auth.currentSession;
  }

  // Get current user's profile
  Future<Map<String, dynamic>?> getCurrentUserProfile() async {
    final user = getCurrentUser();
    if (user == null) return null;

    try {
      final response = await client
          .from('profiles')
          .select()
          .eq('id', user.id)
          .maybeSingle();

      return response;
    } on PostgrestException catch (e) {
      throw Exception('Failed to fetch user profile: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error fetching profile: $e');
    }
  }

  // Check if user is authenticated
  bool get isAuthenticated => getCurrentUser() != null;

  // Stream of auth state changes
  Stream<AuthState> get authStateChanges => client.auth.onAuthStateChange;

  // Reset password
  Future<void> resetPassword(String email) async {
    try {
      await client.auth.resetPasswordForEmail(email);
    } on AuthException {
      rethrow;
    } catch (e) {
      throw Exception('Failed to send reset password email: $e');
    }
  }

  // Update password only
  Future<void> updatePassword(String newPassword) async {
    try {
      final response = await client.auth.updateUser(
        UserAttributes(password: newPassword),
      );

      if (response.user == null) {
        throw AuthException('Failed to update password');
      }
    } on AuthException {
      rethrow;
    } catch (e) {
      throw Exception('Failed to update password: $e');
    }
  }

  // Update email only
  Future<void> updateEmail(String newEmail) async {
    try {
      final response = await client.auth.updateUser(
        UserAttributes(email: newEmail),
      );

      if (response.user == null) {
        throw AuthException('Failed to update email');
      }
    } on AuthException {
      rethrow;
    } catch (e) {
      throw Exception('Failed to update email: $e');
    }
  }

  // Delete user account
  Future<void> deleteAccount() async {
    final user = getCurrentUser();
    if (user == null) {
      throw AuthException('No authenticated user to delete');
    }

    try {
      // First delete the profile
      await client.from('profiles').delete().eq('user_id', user.id);

      // Then delete the auth user (if your Supabase setup allows this)
      // Note: User deletion might need to be handled server-side depending on your setup
      await client.auth.signOut();
    } on PostgrestException catch (e) {
      throw Exception('Failed to delete user profile: ${e.message}');
    } on AuthException {
      rethrow;
    } catch (e) {
      throw Exception('Failed to delete account: $e');
    }
  }
}
