import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_io/theme/theme_provider.dart';
import 'package:weather_io/widgets/my_appbar.dart';
import 'package:weather_io/widgets/page_indicator.dart';
import 'package:weather_io/widgets/weather_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _appBarActions = [];
  final int _pageCount = 3;
  final PageController _pageController = PageController(keepPage: true);

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
      body: Column(
        children: [
          Column(
            children: [
              SizedBox(
                height: 220,
                child: PageView(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: const [WeatherCard(), WeatherCard(), WeatherCard()],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              PageIndicatorBuilder(
                  pageController: _pageController, cardCount: _pageCount),
            ],
          ),
        ],
      ),
    );
  }
}
