import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        height: MediaQuery.of(context).size.height * 0.1,
        title: "Weather.IO",
        appBarActions: _appBarActions,
      ),
    );
  }
}
