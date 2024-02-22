import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:weather_io/model/condition.dart';
import 'package:weather_io/model/weatherData.dart';
import 'package:weather_io/theme/theme.dart';
import 'package:weather_io/theme/theme_provider.dart';

class CityDataPreview extends StatelessWidget {
  final String cityName;
  final Condition condition;
  final WeatherData weatherData;

  const CityDataPreview(
      {super.key,
      required this.cityName,
      required this.condition,
      required this.weatherData});

  String calculateAverageTemperature(String maxTemp, String minTemp) {
    double maxTempD = double.parse(maxTemp);
    double minTempD = double.parse(minTemp);
    double average = (maxTempD + minTempD) / 2;
    return average.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 220,
        width: MediaQuery.of(context).size.width * 0.45,
        child: Stack(children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SvgPicture.asset(
              Provider.of<ThemeProvider>(context).themeData == lightMode
                  ? "assets/svg/pattern-lightmode.svg"
                  : "assets/svg/pattern-darkmode.svg",
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cityName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                Center(
                  child: Text(
                    "${calculateAverageTemperature(weatherData.maxTemp, weatherData.minTemp)}°",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.sunny,
                      size: 30,
                      color: Colors.orange,
                    ),
                    Text(
                      condition.condition,
                      style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          )
        ]));
  }
}
