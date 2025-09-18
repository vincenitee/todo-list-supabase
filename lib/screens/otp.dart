import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_list_supabase/providers/auth_provider.dart';
import 'package:todo_list_supabase/screens/home.dart';
import 'package:todo_list_supabase/widgets/auth_button.dart';
import 'package:todo_list_supabase/widgets/auth_screen_header.dart';
import 'package:todo_list_supabase/widgets/custom_textfield.dart';
import 'package:todo_list_supabase/widgets/form_container.dart';

class OtpScreen extends ConsumerStatefulWidget {
  final String phone;
  const OtpScreen({super.key, required this.phone});

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  final otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ref.listen(authNotifierProvider, (previous, next) {
      next.whenData(
        (state) => {
          if (state.event == AuthChangeEvent.signedIn)
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => HomeScreen()),
              ),
            },
        },
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

          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AuthScreenHeader(
                    title: 'TO-DO LIST',
                    subtitle: 'Verify your account',
                  ),

                  FormContainer(
                    child: Column(
                      children: [
                        Text(
                          'We have sent an OTP to your mobile number.',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 24),

                        CustomTextField.otp(controller: otpController),
                        const SizedBox(height: 12),

                        AuthButton(
                          label: 'Verify OTP',
                          icon: Icons.check,
                          onPressed: () async {
                            await ref
                                .read(authNotifierProvider.notifier)
                                .verifyOtp(widget.phone, otpController.text);
                          },
                        ),

                        AuthButton(
                          label: 'Resend OTP',
                          foregroundColor: Colors.black45,
                          backgroundColor: Colors.transparent,
                          onPressed: () {
                            
                          },
                        ),
                      ],
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
