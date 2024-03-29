import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_io/theme/theme.dart';
import 'package:weather_io/theme/theme_provider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  final VoidCallback toggleTheme;
  final List<Widget> appBarActions;

  const MyAppBar(
      {super.key,
      required this.height,
      required this.title,
      required this.appBarActions,
      required this.toggleTheme});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 0,
      scrolledUnderElevation: 0.0,
      centerTitle: true,
      toolbarHeight: height,
      title: Text(title,
          style: TextStyle(
              color: theme.primary,
              fontSize: 28,
              letterSpacing: 2,
              fontFamily: "ProtestStrike")),
      actions: [
        ...appBarActions,
        IconButton(
            color: theme.primary,
            onPressed: toggleTheme,
            iconSize: 30,
            icon: Provider.of<ThemeProvider>(context).themeData == lightMode
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.sunny))
      ],
    );
  }
}
