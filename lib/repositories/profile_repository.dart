import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_list_supabase/models/profile.dart';

class ProfileRepository {
  final SupabaseClient client;

  ProfileRepository(this.client);

  Future<Profile?> updateUsername(String username) async {
    try {
      final authResponse = await client.auth.getUser();
      final user = authResponse.user;

      if (user == null) throw AuthException('Failed to update user authentication');

      final updatedProfile = await client
          .from('profiles')
          .update({'username': username})
          .eq('user_id', user.id)
          .select()
          .single();

      return Profile.fromJson(updatedProfile);
    } on PostgrestException catch (e) {
      throw Exception('Failed to update username: ${e.message}');
    } catch (e) {
      throw Exception('Failed to update username: $e');
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
}
