import 'package:flutter/material.dart';
import 'package:todo_list_supabase/screens/login.dart';
import 'package:todo_list_supabase/widgets/auth_button.dart';
import 'package:todo_list_supabase/widgets/auth_navigation_row.dart';
import 'package:todo_list_supabase/widgets/auth_screen_header.dart';
import 'package:todo_list_supabase/widgets/custom_textfield.dart';
import 'package:todo_list_supabase/widgets/form_container.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  final _signupFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                          CustomTextField.email(),

                          const SizedBox(height: 20),

                          // Username TextField
                          CustomTextField.username(),

                          const SizedBox(height: 20),

                          // Password TextField
                          CustomTextField.password(),

                          const SizedBox(height: 20),

                          // Signup Button
                          AuthButton(
                            label: 'Sign up',
                            icon: Icons.person_add,
                            onPressed: () {
                              // navigate to signup screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => LoginScreen(),
                                ),
                              );
                            },
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
        ],
      ),
    );
  }
}
