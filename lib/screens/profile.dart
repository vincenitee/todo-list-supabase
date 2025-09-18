import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_list_supabase/providers/auth_provider.dart';
import 'package:todo_list_supabase/widgets/auth_button.dart';
import 'package:todo_list_supabase/widgets/custom_textfield.dart';
import 'package:todo_list_supabase/widgets/profile_header.dart';
import 'package:todo_list_supabase/widgets/stats_card.dart';
import 'package:todo_list_supabase/widgets/stats_section.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final _profileFormKey = GlobalKey<FormState>();

  // Mock data - replace with actual data from your providers


  @override
  Widget build(BuildContext context) {
    ref.listen(authNotifierProvider, (previous, next) {
      next.whenData((state) {
        if (state.event != AuthChangeEvent.signedIn) {
          context.go('/');
        }
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.go('/home');
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            ProfileHeader(),

            // Statistics Cards
            StatSection(),

            // Account Information
            _buildAccountInformation(),

            // Actions Section
            _buildActionsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountInformation() {
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
                Icon(Icons.person_outline, color: Colors.blue.shade700),
                const SizedBox(width: 8),
                const Text(
                  'Account Information',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Form(
              key: _profileFormKey,
              child: Column(
                children: [
                  CustomTextField.username(),
                  const SizedBox(height: 16),
                  CustomTextField.email(),
                  const SizedBox(height: 16),
                  CustomTextField.password(),
                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    child: AuthButton(
                      label: 'Save Changes',
                      icon: Icons.save,
                      onPressed: () {
                        if (_profileFormKey.currentState?.validate() ?? false) {
                          debugPrint('Profile Updated!');
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Profile updated successfully!'),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionsSection() {
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
                  final confirmed = await _showSignOutDialog();
                  if (confirmed) {
                    try {
                      await ref.read(authNotifierProvider.notifier).signOut();
                    } catch (e) {
                      Logger().e('Error signing out: $e');
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Error signing out. Please try again.',
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
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

  Future<bool> _showSignOutDialog() async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Sign Out'),
            content: const Text('Are you sure you want to sign out?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: const Text('Sign Out'),
              ),
            ],
          ),
        ) ??
        false;
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    return '${months[date.month - 1]} ${date.year}';
  }
}
