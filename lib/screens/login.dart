import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_supabase/providers/auth_form_provider.dart';
import 'package:todo_list_supabase/providers/auth_provider.dart';
import 'package:todo_list_supabase/screens/home.dart';
import 'package:todo_list_supabase/screens/signup.dart';
import 'package:todo_list_supabase/widgets/auth_button.dart';
import 'package:todo_list_supabase/widgets/auth_screen_header.dart';
import 'package:todo_list_supabase/widgets/auth_loading_overlay.dart';
import 'package:todo_list_supabase/widgets/auth_navigation_row.dart';
import 'package:todo_list_supabase/widgets/custom_textfield.dart';
import 'package:todo_list_supabase/widgets/error_banner.dart';
import 'package:todo_list_supabase/widgets/form_container.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Creates an independent instance for login
    final formState = ref.watch(authFormProvider('login'));
    final formNotifier = ref.read(authFormProvider('login').notifier);

    // Listen to the actual authentication state for navigation
    ref.listen(authNotifierProvider, (previous, next) {
      // If authenticated move to Home Screen
      next.when(
        data: (user) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => HomeScreen()),
          );
        },

        error: (error, stacktrace) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Error: ${error.toString()}')));
        },

        loading: () {},
      );
    });

    return Scaffold(
      body: Stack(
        children: [
          // Background Screen
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
                    subtitle: 'Login to your account',
                  ),

                  // Login Form
                  FormContainer(
                    child: Form(
                      key: _loginFormKey,
                      child: Column(
                        children: [
                          if (formState.errorMessage != null)
                            ErrorBanner(errorMessage: formState.errorMessage!),

                          // Email TextField
                          CustomTextField.email(
                            onChanged: formNotifier.updateEmail,
                            errorText: formState.emailError,
                          ),

                          const SizedBox(height: 20),

                          // Password TextField
                          CustomTextField.password(
                            onChanged: formNotifier.updatePassword,
                            errorText: formState.passwordError,
                          ),

                          const SizedBox(height: 20),

                          // Login Button - reactive to loading state
                          AuthButton(
                            label: formState.isLoading
                                ? 'Logging in'
                                : 'Log in',
                            icon: formState.isLoading
                                ? Icons.hourglass_empty
                                : Icons.login,
                            onPressed: formState.isLoading
                                ? () {}
                                : formNotifier.submitLogin,
                          ),

                          AuthNavigationRow(
                            text: 'Don\'t have an account?',
                            linkText: 'Sign up',
                            onPressed: formState.isLoading
                                ? () {}
                                : () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignupScreen(),
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

          // Loading overlay
          if (formState.isLoading) AuthLoadingOverlay(message: 'Loading...'),
        ],
      ),
    );
  }
}
