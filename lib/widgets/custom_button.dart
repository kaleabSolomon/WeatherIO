import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color btnColor;
  final VoidCallback btnAction;
  const CustomButton(
      {super.key,
      required this.title,
      required this.btnColor,
      required this.btnAction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextButton(
        onPressed: btnAction,
        style: TextButton.styleFrom(
          backgroundColor: btnColor,
          padding: const EdgeInsets.symmetric(vertical: 18), // Button padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Button border radius
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
