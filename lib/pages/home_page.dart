import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_io/theme/theme_provider.dart';
import 'package:weather_io/widgets/future_forecast.dart';
import 'package:weather_io/widgets/my_appbar.dart';
import 'package:weather_io/widgets/page_indicator.dart';
import 'package:weather_io/widgets/weather_card.dart';
import 'package:weather_io/widgets/weather_stats_today.dart';

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
          const WeatherStatsToday(),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.92,
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 14),
                    child: Text(
                      "5 days of Forecast",
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: "ProtestStrike",
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: const <Widget>[
                        FutureForecast(
                          day: "Monday",
                          condition: "sunny",
                          maxTemp: "22",
                          minTemp: "19",
                        ),
                        FutureForecast(
                          day: "Monday",
                          condition: "sunny",
                          maxTemp: "22",
                          minTemp: "19",
                        ),
                        FutureForecast(
                          day: "Monday",
                          condition: "sunny",
                          maxTemp: "22",
                          minTemp: "19",
                        ),
                        FutureForecast(
                          day: "Monday",
                          condition: "sunny",
                          maxTemp: "22",
                          minTemp: "19",
                        ),
                        FutureForecast(
                          day: "Monday",
                          condition: "sunny",
                          maxTemp: "22",
                          minTemp: "19",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
