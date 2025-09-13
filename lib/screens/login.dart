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
  @override
  Widget build(BuildContext context) {
    // Creates an independent instance for login
    final loginFormState = ref.watch(authFormProvider('login'));
    final loginFormNotifier = ref.read(authFormProvider('login').notifier);

    // Listen to the actual authentication state for navigation
    ref.listen(authNotifierProvider, (previous, next) {
      // If authenticated move to Home Screen
      next.when(
        data: (user) {
          if (user != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HomeScreen()),
            );
          }
        },

        loading: () {},

        error: (e, st) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(e.toString())));
        },
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
                      child: Column(
                        children: [
                          if (loginFormState.errorMessage != null)
                            ErrorBanner(
                              errorMessage: loginFormState.errorMessage!,
                            ),

                          // Email TextField
                          CustomTextField.email(
                            onChanged: loginFormNotifier.updateEmail,
                            errorText: loginFormState.emailError,
                          ),

                          const SizedBox(height: 20),

                          // Password TextField
                          CustomTextField.password(
                            onChanged: loginFormNotifier.updatePassword,
                            errorText: loginFormState.passwordError,
                          ),

                          const SizedBox(height: 20),

                          // Login Button - reactive to loading state
                          AuthButton(
                            label: loginFormState.isLoading
                                ? 'Logging in'
                                : 'Log in',
                            icon: loginFormState.isLoading
                                ? Icons.hourglass_empty
                                : Icons.login,
                            onPressed: loginFormState.isLoading
                                ? () {}
                                : loginFormNotifier.submitLogin,
                          ),

                          AuthNavigationRow(
                            text: 'Don\'t have an account?',
                            linkText: 'Sign up',
                            onPressed: loginFormState.isLoading
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
          if (loginFormState.isLoading)
            AuthLoadingOverlay(message: 'Loading...'),
        ],
      ),
    );
  }
}
