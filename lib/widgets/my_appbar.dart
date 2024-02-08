import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  final Drawer? drawer;
  const MyAppBar(
      {super.key,
      required this.height,
      required this.title,
      required this.drawer});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: height,
      title: Text(title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
