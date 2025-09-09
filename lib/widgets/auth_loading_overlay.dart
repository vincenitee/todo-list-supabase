import 'package:flutter/material.dart';

class AuthLoadingOverlay extends StatelessWidget {
  const AuthLoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withValues(alpha: 0.3),
      child: const Center(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Logging in...'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
