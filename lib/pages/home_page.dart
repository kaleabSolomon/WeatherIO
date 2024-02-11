import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_io/theme/theme_provider.dart';
import 'package:weather_io/widgets/my_appbar.dart';
import 'package:weather_io/widgets/page_indicator.dart';
import 'package:weather_io/widgets/weather_card.dart';
import 'package:weather_io/widgets/weather_stats.dart';

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
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width * 0.92,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 172, 225, 255),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14.0, vertical: 14),
                  child: Text(
                    "Today",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "ProtestStrike",
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WeatherStats(
                        description: "temperature",
                        stat: "20°",
                        imagePath: "assets/temp.png"),
                    WeatherStats(
                        description: "sun duration",
                        stat: "5 hrs",
                        imagePath: "assets/sun.png"),
                    WeatherStats(
                        description: "wind speed",
                        stat: "20 mi/hr",
                        imagePath: "assets/wind.png"),
                    WeatherStats(
                        description: "rain",
                        stat: "0.3 in",
                        imagePath: "assets/rain.png"),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
