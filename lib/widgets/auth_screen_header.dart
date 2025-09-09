import 'package:flutter/material.dart';

class AuthScreenHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthScreenHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.list, size: 32, color: Colors.white),
            SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Text(
          subtitle,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    );
  }
}
