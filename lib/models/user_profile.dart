import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_list_supabase/models/profile.dart';

class UserProfile {
  final User authUser;
  final Profile profile;

  UserProfile({
    required this.authUser,
    required this.profile
  });

  String get id => authUser.id;
  String get email => authUser.email ?? '';
  String get username => profile.username;
}