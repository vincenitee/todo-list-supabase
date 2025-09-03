import 'package:flutter/material.dart';
import 'package:todo_list_supabase/screens/login.dart';
import 'package:todo_list_supabase/widgets/auth_navigation_row.dart';
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
                        'Create an account.',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
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
                          SizedBox(
                            width: double.infinity,
                            child: TextButton.icon(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.blue.shade700,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              label: Text('Sign up'),
                              icon: Icon(Icons.person_add),
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
        ],
      ),
    );
  }
}
