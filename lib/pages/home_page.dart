import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_io/model/forecast.dart';
import 'package:weather_io/pages/add_locations_page.dart';
import 'package:weather_io/provider/forecast_provider.dart';
import 'package:weather_io/provider/page_data_provider.dart';
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
  final PageController _pageController = PageController(keepPage: true);

  @override
  void didChangeDependencies() {
    final forecastProvider = Provider.of<ForecastProvider>(context);
    final activePageProvider =
        Provider.of<PageDataProvider>(context, listen: false);
    super.didChangeDependencies();
    _appBarActions = [
      IconButton(
          onPressed: () {
            forecastProvider.getSavedForecastData();
            activePageProvider.pageNumber = 0;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddLocationsPage()));
          },
          icon: const Icon(
            Icons.add,
            size: 30,
          ))
    ];
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<ForecastProvider>(context, listen: false)
          .getSavedForecastData();
    });
  }

  void toggleTheme() {
    Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
  }

  String calculateAverageTemperature(String maxTemp, String minTemp) {
    double maxTempD = double.parse(maxTemp);
    double minTempD = double.parse(minTemp);
    double average = (maxTempD + minTempD) / 2;
    return average.toStringAsFixed(0);
  }

  @override
  Widget build(BuildContext context) {
    final List<Forecast> forecastDataList =
        Provider.of<ForecastProvider>(context, listen: false).forecastData;
    final activePageProvider = Provider.of<PageDataProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  child: PageView.builder(
                      itemCount: forecastDataList.isNotEmpty
                          ? forecastDataList.length
                          : 1,
                      controller: _pageController,
                      onPageChanged: (int pageIndex) {
                        activePageProvider.pageNumber = pageIndex;
                        print(activePageProvider.pageNumber);
                      },
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return forecastDataList.isEmpty
                            ? const WeatherCard(
                                isNoForecast: true,
                              )
                            : WeatherCard(
                                location: forecastDataList[index].city,
                                date:
                                    forecastDataList[index].weatherData[0].date,
                                temperature: calculateAverageTemperature(
                                  forecastDataList[index]
                                      .weatherData[0]
                                      .maxTemp,
                                  forecastDataList[index]
                                      .weatherData[0]
                                      .minTemp,
                                ),
                                weatherCondition:
                                    forecastDataList[index].condition.condition,
                              );
                      })),
              const SizedBox(
                height: 10,
              ),
              PageIndicatorBuilder(
                  pageController: _pageController,
                  cardCount: forecastDataList.length),
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
                    child: ListView.builder(
                      itemCount: forecastDataList.isNotEmpty
                          ? forecastDataList.length
                          : 1,
                      itemBuilder: (BuildContext context, int index) =>
                          forecastDataList.isEmpty
                              ? const FutureForecast(isNoForecast: true)
                              : FutureForecast(
                                  day: forecastDataList[
                                          activePageProvider.pageNumber]
                                      .weatherData[index]
                                      .date,
                                  condition: forecastDataList[
                                          activePageProvider.pageNumber]
                                      .condition
                                      .condition,
                                  maxTemp: forecastDataList[
                                          activePageProvider.pageNumber]
                                      .weatherData[index]
                                      .maxTemp,
                                  minTemp: forecastDataList[
                                          activePageProvider.pageNumber]
                                      .weatherData[index]
                                      .minTemp,
                                ),
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
