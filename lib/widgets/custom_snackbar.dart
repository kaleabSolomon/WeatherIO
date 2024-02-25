import 'package:flutter/material.dart';

class CustomSnackBar {
  final String text;
  final Color color;
  const CustomSnackBar({required this.text, required this.color});

  show(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      padding: const EdgeInsets.all(24),
      content: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
    ));
  }
}
