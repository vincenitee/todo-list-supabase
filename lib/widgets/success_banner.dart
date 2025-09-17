import 'package:flutter/material.dart';

class SuccessBanner extends StatelessWidget {
  final String successMessage;

  const SuccessBanner({super.key, required this.successMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.green.shade600, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              successMessage,
              style: TextStyle(color: Colors.green.shade600, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}