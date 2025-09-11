import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_supabase/providers/auth_provider.dart';
import 'package:todo_list_supabase/screens/home.dart';
import 'package:todo_list_supabase/screens/login.dart';
import 'package:todo_list_supabase/widgets/auth_button.dart';
import 'package:todo_list_supabase/widgets/auth_loading_overlay.dart';
import 'package:todo_list_supabase/widgets/auth_navigation_row.dart';
import 'package:todo_list_supabase/widgets/auth_screen_header.dart';
import 'package:todo_list_supabase/widgets/custom_textfield.dart';
import 'package:todo_list_supabase/widgets/form_container.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => SignupScreenState();
}

class SignupScreenState extends ConsumerState<SignupScreen> {
  final _signupFormKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  String _username = '';

  void _handleSignUp() async {
    if (_signupFormKey.currentState!.validate()) {
      _signupFormKey.currentState!.save();

      await ref
          .read(authNotifierProvider.notifier)
          .signup(_email, _username, _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);

    ref.listen(authNotifierProvider, (previous, next) {
      next.when(
        data: (user) {
          if (user != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }
        },
        error: (error, stackTrace) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to register user: ${error.toString()}'),
              backgroundColor: Colors.red,
            ),
          );
        },
        loading: () {},
      );
    });

    return Scaffold(
      body: Stack(
        children: [
          // Background
          Column(
            children: [
              Expanded(child: Container(color: Colors.blue.shade700)),
              Expanded(child: Container(color: Colors.white)),
            ],
          ),

          // Login Form
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // App Title
                  AuthScreenHeader(
                    title: 'TO-DO LIST',
                    subtitle: 'Create an account.',
                  ),

                  // Signup Form
                  FormContainer(
                    child: Form(
                      key: _signupFormKey,
                      child: Column(
                        children: [
                          // Email TextField
                          CustomTextField.email(
                            onSaved: (value) {
                              _email = value ?? '';
                            },
                          ),

                          const SizedBox(height: 20),

                          // Username TextField
                          CustomTextField.username(
                            onSaved: (value) {
                              _username = value ?? '';
                            },
                          ),

                          const SizedBox(height: 20),

                          // Password TextField
                          CustomTextField.password(
                            onSaved: (value) {
                              _password = value ?? '';
                            },
                          ),

                          const SizedBox(height: 20),

                          // Signup Button
                          authState.when(
                            data: (_) => AuthButton(
                              label: 'Sign up',
                              icon: Icons.person_add,
                              onPressed: _handleSignUp,
                            ),
                            error: (_, _) => AuthButton(
                              label: 'Sign up',
                              icon: Icons.person_add,
                              onPressed: _handleSignUp,
                            ),
                            loading: () => AuthButton(
                              label: 'Signing in...',
                              icon: Icons.hourglass_empty,
                              onPressed: () {},
                            ),
                          ),

                          AuthNavigationRow(
                            text: 'Already have an account?',
                            linkText: 'Sign in',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          if (authState.isLoading)
            AuthLoadingOverlay(message: 'Signing you in...'),
        ],
      ),
    );
  }
}
