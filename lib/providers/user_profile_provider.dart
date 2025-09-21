import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_list_supabase/models/profile.dart';
import 'package:todo_list_supabase/models/user_profile.dart';
import 'package:todo_list_supabase/providers/auth_provider.dart';
import 'package:todo_list_supabase/providers/profile_provider.dart';

part 'user_profile_provider.g.dart';

@riverpod
UserProfile userProfile(Ref ref) {
  final authState = ref.watch(authNotifierProvider);
  final profileState = ref.watch(profileNotifierProvider);

  final AuthState? authUser = authState.asData?.value;
  final Profile? profile = profileState.asData?.value;

  return UserProfile(
    id: authUser?.session?.user.id ?? '',
    email: authUser?.session?.user.email ?? '',
    username: profile?.username,
    createdAt: profile?.createdAt,
  );
}
