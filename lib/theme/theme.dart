import "package:flutter/material.dart";

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      background: Color.fromARGB(255, 243, 248, 255),
      primary: Color.fromARGB(255, 13, 60, 99),
      secondary: Colors.white,
    ));
ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      background: Color.fromARGB(255, 25, 29, 35),
      primary: Color.fromARGB(255, 255, 234, 204),
      secondary: Color.fromARGB(255, 0, 0, 0),
    ));
