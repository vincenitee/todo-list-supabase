import 'package:flutter/material.dart';
import 'package:todo_list_supabase/widgets/custom_textfield.dart';

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
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 24,
                    ),
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),

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

                          SizedBox(
                            width: double.infinity,
                            child: TextButton.icon(
                              onPressed: () {
                                bool validated = _formGlobalKey.currentState!
                                    .validate();

                                if (validated) {
                                  _formGlobalKey.currentState!.save();
                                  debugPrint(
                                    'Email: $_email\nPassword: $_password',
                                  );
                                }
                              },
                              label: const Text('Login'),
                              icon: Icon(Icons.login),

                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.blue.shade700,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account? "),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Placeholder(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Sign up',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration
                                        .underline, // looks like a link
                                  ),
                                ),
                              ),
                            ],
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
