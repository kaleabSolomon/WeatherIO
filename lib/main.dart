import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:provider/provider.dart';
import 'package:weather_io/model/condition.dart';
import 'package:weather_io/model/forecast.dart';
import 'package:weather_io/model/weatherData.dart';
import 'package:weather_io/pages/home_page.dart';
import 'package:weather_io/provider/forecast_provider.dart';
import 'package:weather_io/provider/page_data_provider.dart';
import 'package:weather_io/provider/suggestions_provider.dart';
import 'package:weather_io/theme/theme_provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ForecastAdapter());
  Hive.registerAdapter(ConditionAdapter());
  Hive.registerAdapter(WeatherDataAdapter());
  await Hive.openBox<Forecast>("forecastBox");
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => SuggestionsProvider()),
      ChangeNotifierProvider(create: (context) => ForecastProvider()),
      ChangeNotifierProvider(create: (context) => PageDataProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const HomePage(),
    );
  }
}
