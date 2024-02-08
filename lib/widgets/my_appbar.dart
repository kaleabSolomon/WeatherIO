import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;

  const MyAppBar({
    super.key,
    required this.height,
    required this.title,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      toolbarHeight: height,
      title: Text(title,
          style: const TextStyle(
              color: Color.fromARGB(255, 13, 60, 99),
              fontSize: 28,
              letterSpacing: 2,
              fontFamily: "ProtestStrike")),
    );
  }
}
