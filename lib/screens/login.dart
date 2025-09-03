import 'package:flutter/material.dart';
import 'package:todo_list_supabase/screens/home.dart';
import 'package:todo_list_supabase/screens/signup.dart';
import 'package:todo_list_supabase/widgets/auth_button.dart';
import 'package:todo_list_supabase/widgets/auth_navigation_row.dart';
import 'package:todo_list_supabase/widgets/custom_textfield.dart';
import 'package:todo_list_supabase/widgets/form_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formGlobalKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
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
                      key: _formGlobalKey,
                      child: Column(
                        children: [
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

                          AuthButton(
                            label: 'Login',
                            icon: Icons.login,
                            onPressed: () {
                              // navigate to signup screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => HomeScreen(),
                                ),
                              );
                            },
                          ),

                          AuthNavigationRow(
                            text: 'Don\'t have an account?',
                            linkText: 'Sign up',
                            onPressed: () {
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
        ],
      ),
    );
  }
}
