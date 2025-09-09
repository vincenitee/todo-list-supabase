import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_supabase/providers/auth_provider.dart';
import 'package:todo_list_supabase/screens/home.dart';
import 'package:todo_list_supabase/screens/signup.dart';
import 'package:todo_list_supabase/widgets/auth_button.dart';
import 'package:todo_list_supabase/widgets/auth_loading_overlay.dart';
import 'package:todo_list_supabase/widgets/auth_navigation_row.dart';
import 'package:todo_list_supabase/widgets/custom_textfield.dart';
import 'package:todo_list_supabase/widgets/form_container.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  void _handleLogin() async {
    final authState = ref.watch(authNotifierProvider);
    if (_loginFormKey.currentState!.validate()) {
      _loginFormKey.currentState!.save();

      // Call the login method from your auth provider
      await ref.read(authNotifierProvider.notifier).signIn(_email, _password);

      // Handle the result if needed
      authState.when(
        data: (user) {
          if (user != null) {
            // Navigate to home screen on successful login
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }
        },
        error: (error, stackTrace) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Login failed: ${error.toString()}'),
              backgroundColor: Colors.red,
            ),
          );
        },
        loading: () {
          const Center(child: CircularProgressIndicator());
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);

    // Listen to auth state changes for navigation
    ref.listen(authNotifierProvider, (previous, next) {
      next.when(
        data: (user) {
          if (user != null) {
            // Navigate to home screen when user is authenticated
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }
        },
        error: (error, stackTrace) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Authentication error: ${error.toString()}'),
              backgroundColor: Colors.red,
            ),
          );
        },
        loading: () {
          // Optional: Handle loading state
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
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.list, size: 32, color: Colors.white),
                          SizedBox(width: 16),
                          Text(
                            'TO-DO LIST',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Login to your account.',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),

                  // Login Form
                  FormContainer(
                    child: Form(
                      key: _loginFormKey,
                      child: Column(
                        children: [
                          // Show error message if there's an error
                          authState.when(
                            data: (_) => const SizedBox.shrink(),
                            error: (error, _) => Container(
                              margin: const EdgeInsets.only(bottom: 16),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.red.shade50,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.red.shade200),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.error,
                                    color: Colors.red.shade600,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      error.toString(),
                                      style: TextStyle(
                                        color: Colors.red.shade600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            loading: () => const SizedBox.shrink(),
                          ),

                          // Email TextField
                          CustomTextField.email(
                            onSaved: (value) {
                              _email = value ?? '';
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

                          // Login Button - reactive to loading state
                          authState.when(
                            data: (_) => AuthButton(
                              label: 'Login',
                              icon: Icons.login,
                              onPressed: _handleLogin,
                            ),
                            error: (_, _) => AuthButton(
                              label: 'Login',
                              icon: Icons.login,
                              onPressed: _handleLogin,
                            ),
                            loading: () => AuthButton(
                              label: 'Logging in...',
                              icon: Icons.hourglass_empty,
                              onPressed: () {}, // Disable button during loading
                            ),
                          ),

                          AuthNavigationRow(
                            text: 'Don\'t have an account?',
                            linkText: 'Sign up',
                            onPressed: authState.isLoading
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
          if (authState.isLoading)
            AuthLoadingOverlay(),
        ],
      ),
    );
  }
}
