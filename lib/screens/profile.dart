import 'package:flutter/material.dart';
import 'package:todo_list_supabase/widgets/auth_button.dart';
import 'package:todo_list_supabase/widgets/custom_textfield.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _profileFormKey = GlobalKey<FormState>();

  String _username = '';
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Form Label
            const Text('Account Information', style: TextStyle(fontSize: 20)),

            // User Information Form
            Form(
              key: _profileFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),

                  CustomTextField.username(
                    onSaved: (value) => _username = value ?? '',
                  ),

                  const SizedBox(height: 16),

                  CustomTextField.email(
                    onSaved: (value) => _email = value ?? '',
                  ),

                  const SizedBox(height: 16),

                  CustomTextField.password(
                    onSaved: (value) => _password = value ?? '',
                  ),

                  const SizedBox(height: 16),

                  AuthButton(
                    label: 'Save changes',
                    icon: Icons.save,
                    onPressed: () {
                      debugPrint('Profile Updated!');
                    },
                  ),

                  const Divider(),

                  AuthButton(
                    label: 'Sign out',
                    icon: Icons.logout,
                    backgroundColor: Colors.red,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
