import 'package:flutter/material.dart';

class AuthNavigationRow extends StatelessWidget {
  final String text;
  final String linkText;
  final VoidCallback onPressed;

  const AuthNavigationRow({
    super.key,
    required this.text,
    required this.linkText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        TextButton(
          onPressed: onPressed,
          child: Text(
            linkText,
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline, // looks like a link
            ),
          ),
        ),
      ],
    );
  }
}
