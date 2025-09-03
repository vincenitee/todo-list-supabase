import 'package:flutter/material.dart';
import 'package:todo_list_supabase/screens/home.dart';
import 'package:todo_list_supabase/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formGlobalKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
              child: Container(
                padding: const EdgeInsets.all(16),
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
                      CustomTextField.email(controller: _emailController),

                      const SizedBox(height: 20),

                      CustomTextField.password(controller: _passwordController),

                      const SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        child: TextButton.icon(
                          onPressed: () {
                            bool validated = _formGlobalKey.currentState!
                                .validate();

                            if (validated) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
