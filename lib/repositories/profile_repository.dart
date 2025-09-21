import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_list_supabase/models/profile.dart';

class ProfileRepository {
  final SupabaseClient client;

  ProfileRepository(this.client);

  Future<Profile?> updateUsername(String username) async {
    try {
      // Fetch the current authenticated user
      final user = client.auth.currentUser;

      // Check if the user is null
      if (user == null) {
        throw Exception('No authenticated user found');
      }

      // Update the username in the profiles table
      final response = await client
          .from('profiles')
          .update({'username': username})
          .eq('id', user.id)
          .select()
          .single();

      return Profile.fromJson(response);
    } catch (e) {
      // Let the provider handle the error
      rethrow;
    }
  }

  Future<Profile?> getProfile() async {
    final response = await client.auth.getUser();
    final user = response.user;

    if (user == null) throw AuthException('Failed to fetch authenticated user');

    final profileRow = await client
        .from('profiles')
        .select()
        .eq('id', user.id)
        .maybeSingle();

    return profileRow != null ? Profile.fromJson(profileRow) : null;
  }

  Future<Profile?> getProfileById(String id) async {
    final profileRow = await client
        .from('profiles')
        .select()
        .eq('id', id)
        .maybeSingle();

    return profileRow != null ? Profile.fromJson(profileRow) : null;
  }
}
