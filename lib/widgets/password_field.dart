import 'package:flutter/material.dart';
import 'package:todo_list_supabase/widgets/custom_textfield.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController? controller;

  const PasswordField({super.key, this.controller});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: widget.controller,
      hintText: 'Password',
      obscureText: _obscureText,
      suffixIcon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
      onSuffixIconPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    );
  }
}
