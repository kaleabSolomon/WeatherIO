import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_io/theme/theme_provider.dart';
import 'package:weather_io/widgets/my_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _appBarActions = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _appBarActions = [
      IconButton(onPressed: () {}, icon: const Icon(Icons.add))
    ];
  }

  void toggleTheme() {
    Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        height: MediaQuery.of(context).size.height * 0.15,
        title: "Weather.IO",
        appBarActions: _appBarActions,
        toggleTheme: toggleTheme,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // scrollDirection: Axis.horizontal,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            width: MediaQuery.of(context).size.width * 0.92,
            height: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromARGB(255, 165, 226, 255),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Addis Abeba"),
                        Text("Saturday, 01 may 2021")
                      ],
                    ),
                    Text("24°"),
                    Text("Sunny")
                  ],
                ),
                Icon(
                  Icons.sunny,
                  size: 80,
                  color: Colors.orange,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
