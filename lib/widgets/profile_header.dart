import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_supabase/providers/profile_provider.dart';
import 'package:todo_list_supabase/utils/app_date_utils.dart';

class ProfileHeader extends ConsumerWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileNotifierProvider);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue.shade700, Colors.blue.shade500],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: Column(
          children: [
            // Profile Avatar
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Icon(Icons.person, size: 50, color: Colors.blue.shade700),
            ),

            const SizedBox(height: 16),

            // User Name
            profileState.when(
              data: (profile) => Text(
                profile?.username ?? '',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              loading: () => Container(
                width: 120,
                height: 16,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              error: (err, _) => Text(
                'Error: $err',
                style: const TextStyle(color: Colors.red),
              ),
            ),

            const SizedBox(height: 8),

            // Member Since (you could also display createdAt here if available)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.calendar_today,
                  color: Colors.white70,
                  size: 16,
                ),
                const SizedBox(width: 8),
                profileState.when(
                  data: (profile) {
                    final memberSince = profile?.createdAt;
                    final formattedDate = memberSince != null
                        ? AppDateUtils.formatDate(memberSince)
                        : 'Unknown';

                    return Text(
                      'Member since $formattedDate', // replace with profile?.createdAt later
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    );
                  },
                  error: (e, st) => Text(
                    'Error loading date',
                    style: const TextStyle(color: Colors.red),
                  ),
                  loading: () => Container(
                    width: 120,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
