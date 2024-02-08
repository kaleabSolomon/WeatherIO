import 'package:flutter/material.dart';
import 'package:weather_io/widgets/my_appbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: MyAppBar(
              height: MediaQuery.of(context).size.height * 0.1,
              title: "Weather.IO")),
    );
  }
}
