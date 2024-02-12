import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_io/theme/theme_provider.dart';
import 'package:weather_io/widgets/my_appbar.dart';

class AddLocationsPage extends StatefulWidget {
  const AddLocationsPage({super.key});

  @override
  State<AddLocationsPage> createState() => _AddLocationsPageState();
}

class _AddLocationsPageState extends State<AddLocationsPage> {
  void toggleTheme() {
    Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        height: MediaQuery.of(context).size.height * 0.15,
        title: "City",
        toggleTheme: toggleTheme,
        appBarActions: [],
      ),
      body: Column(children: [
        Expanded(
            child: Container(
          color: Colors.blue,
        )),
        Container(
          margin: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 0, 34, 85),
              padding:
                  const EdgeInsets.symmetric(vertical: 18), // Button padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Button border radius
              ),
            ),
            child: const Text(
              "Add Location",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
