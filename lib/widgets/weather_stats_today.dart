import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_io/model/forecast.dart';
import 'package:weather_io/theme/theme.dart';
import 'package:weather_io/theme/theme_provider.dart';
import 'package:weather_io/widgets/weather_stat.dart';

class WeatherStatsToday extends StatefulWidget {
  final Forecast? forecastToday;
  final bool? isNoForecast;

  const WeatherStatsToday({super.key, this.isNoForecast, this.forecastToday});

  @override
  State<WeatherStatsToday> createState() => _WeatherStatsTodayState();
}

class _WeatherStatsTodayState extends State<WeatherStatsToday> {
  String calculateAverageTemperature(String maxTemp, String minTemp) {
    double maxTempD = double.parse(maxTemp);
    double minTempD = double.parse(minTemp);
    double average = (maxTempD + minTempD) / 2;
    return average.toStringAsFixed(0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width * 0.92,
      decoration: BoxDecoration(
        color: Provider.of<ThemeProvider>(context).themeData == lightMode
            ? const Color.fromARGB(255, 74, 144, 255)
            : const Color.fromARGB(255, 8, 20, 86),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14),
            child: Text(
              "Today",
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: "ProtestStrike",
                  color: Theme.of(context).colorScheme.primary),
            ),
          ),
          widget.isNoForecast == true
              ? Center(
                  child: Text(
                  "No Forecast Available",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                ))
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WeatherStat(
                        description: "temperature",
                        stat: calculateAverageTemperature(
                            widget.forecastToday!.weatherData[0].maxTemp,
                            widget.forecastToday!.weatherData[0].maxTemp),
                        imagePath: "assets/temp.png"),
                    WeatherStat(
                        description: "sun duration",
                        stat: widget.forecastToday!.weatherData[0].sunDuration,
                        imagePath: "assets/sun.png"),
                    WeatherStat(
                        description: "wind speed",
                        stat: widget.forecastToday!.weatherData[0].windSpeed,
                        imagePath: "assets/wind.png"),
                    WeatherStat(
                        description: "rain",
                        stat: widget.forecastToday!.weatherData[0].rainHeight,
                        imagePath: "assets/rain.png"),
                  ],
                )
        ],
      ),
    );
  }
}
