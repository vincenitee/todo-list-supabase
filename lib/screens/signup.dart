import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list_supabase/providers/auth_form_provider.dart';
import 'package:todo_list_supabase/widgets/auth_button.dart';
import 'package:todo_list_supabase/widgets/auth_loading_overlay.dart';
import 'package:todo_list_supabase/widgets/auth_navigation_row.dart';
import 'package:todo_list_supabase/widgets/auth_screen_header.dart';
import 'package:todo_list_supabase/widgets/custom_textfield.dart';
import 'package:todo_list_supabase/widgets/error_banner.dart';
import 'package:todo_list_supabase/widgets/form_container.dart';
import 'package:todo_list_supabase/widgets/success_banner.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => SignupScreenState();
}

class SignupScreenState extends ConsumerState<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    // Creates an INDEPENDENT instance for signup
    final signupFormState = ref.watch(authFormProvider('signup'));
    final signupFormNotifier = ref.read(authFormProvider('signup').notifier);

    ref.listen(authFormProvider('signup'), (prev, next) {
      // Navigates to the verification screen
      if (next.navigateToVerification == true &&
          prev?.navigateToVerification != true) {
        context.go(
          '/email_verification',
          extra: {'email': signupFormState.email},
        );
      }
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
                      child: Column(
                        children: [
                          if (signupFormState.errorMessage != null)
                            ErrorBanner(
                              errorMessage: signupFormState.errorMessage!,
                            ),

                          if (signupFormState.successMessage != null)
                            SuccessBanner(
                              successMessage: signupFormState.successMessage!,
                            ),

                          // Email TextField
                          CustomTextField.email(
                            onChanged: signupFormNotifier.updateEmail,
                            errorText: signupFormState.emailError,
                          ),

                          const SizedBox(height: 20),

                          // Username TextField
                          CustomTextField.username(
                            onChanged: signupFormNotifier.updateUsername,
                            errorText: signupFormState.usernameError,
                          ),

                          const SizedBox(height: 20),

                          // Password TextField
                          CustomTextField.password(
                            onChanged: signupFormNotifier.updatePassword,
                            errorText: signupFormState.passwordError,
                          ),

                          const SizedBox(height: 20),

                          // Password TextField
                          CustomTextField.confirmPassword(
                            onChanged: signupFormNotifier.updateConfirmPassword,
                            errorText: signupFormState.confirmPasswordError,
                          ),

                          const SizedBox(height: 20),

                          // Signup Button
                          AuthButton(
                            label: signupFormState.isLoading
                                ? 'Signing up'
                                : 'Sign up',
                            icon: signupFormState.isLoading
                                ? Icons.hourglass_empty
                                : Icons.person_add,
                            onPressed: signupFormState.isLoading
                                ? () {}
                                : signupFormNotifier.submitEmailSignup,
                          ),

                          AuthNavigationRow(
                            text: 'Already have an account?',
                            linkText: 'Sign in',
                            onPressed: () {
                              context.go('/');
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
          if (signupFormState.isLoading)
            AuthLoadingOverlay(message: 'Creating your account...'),
        ],
      ),
    );
  }
}
