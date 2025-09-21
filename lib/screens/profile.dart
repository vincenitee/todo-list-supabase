import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_list_supabase/providers/auth_provider.dart';
import 'package:todo_list_supabase/widgets/account_actions.dart';
import 'package:todo_list_supabase/widgets/account_information.dart';
import 'package:todo_list_supabase/widgets/profile_header.dart';
import 'package:todo_list_supabase/widgets/stats_section.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    // Watches auth state changes
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
            AccountInformationSection(),

            // Actions Section  
            AccountActions(),
          ],
        ),
      ),
    );
  }

}
