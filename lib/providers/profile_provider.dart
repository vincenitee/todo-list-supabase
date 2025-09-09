import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_list_supabase/models/profile.dart';
import 'package:todo_list_supabase/providers/profile_repository_provider.dart';
import 'package:todo_list_supabase/repositories/profile_repository.dart';

part 'profile_provider.g.dart';

@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  late final ProfileRepository _repository;

  @override
  FutureOr<Profile?> build() {
    _repository = ref.read(profileRepositoryProvider);
    return _repository.getProfile();
  }

  // Update Username
  Future<void> updateUsername(String username) async {
    state = AsyncValue.loading();

    try {
      final updatedProfile = await _repository.updateUsername(username);
      state = AsyncValue.data(updatedProfile);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
