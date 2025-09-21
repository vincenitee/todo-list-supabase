import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:todo_list_supabase/providers/auth_provider.dart';
import 'package:todo_list_supabase/widgets/auth_button.dart';

class AccountActions extends ConsumerWidget {
  const AccountActions({super.key});

  Future<bool> _showSignOutDialog(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Sign Out'),
            content: const Text('Are you sure you want to sign out?'),
            actions: [
              TextButton(
                onPressed: () => context.pop(false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => context.pop(true),
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: const Text('Sign Out'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.settings_outlined, color: Colors.blue.shade700),
                const SizedBox(width: 8),
                const Text(
                  'Account Actions',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Additional action buttons can go here
            ListTile(
              leading: Icon(
                Icons.notifications_outlined,
                color: Colors.grey.shade600,
              ),
              title: const Text('Notification Settings'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Fluttertoast.showToast(msg: 'Feature coming soon!');
              },
            ),

            const Divider(),

            ListTile(
              leading: Icon(
                Icons.security_outlined,
                color: Colors.grey.shade600,
              ),
              title: const Text('Privacy & Security'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Fluttertoast.showToast(msg: 'Feature coming soon!');
              },
            ),

            const Divider(),

            ListTile(
              leading: Icon(Icons.help_outline, color: Colors.grey.shade600),
              title: const Text('Help & Support'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Fluttertoast.showToast(msg: 'Feature coming soon!');
              },
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: AuthButton(
                label: 'Sign Out',
                icon: Icons.logout,
                backgroundColor: Colors.red,
                onPressed: () async {
                  // Show confirmation dialog
                  final confirmed = await _showSignOutDialog(context);
                  if (confirmed) {
                    try {
                      await ref.read(authNotifierProvider.notifier).signOut();
                    } catch (e) {
                      Logger().e('Error signing out: $e');
                      Fluttertoast.showToast(
                        msg: 'Error signing out. Please try again.',
                        backgroundColor: Colors.red,
                      );
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
