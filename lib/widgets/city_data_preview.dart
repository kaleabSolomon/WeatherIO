import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:weather_io/model/condition.dart';
import 'package:weather_io/model/weatherData.dart';
import 'package:weather_io/provider/forecast_provider.dart';
import 'package:weather_io/theme/theme.dart';
import 'package:weather_io/theme/theme_provider.dart';

class CityDataPreview extends StatefulWidget {
  final String cityName;
  final Condition condition;
  final WeatherData weatherData;

  const CityDataPreview(
      {super.key,
      required this.cityName,
      required this.condition,
      required this.weatherData});

  @override
  State<CityDataPreview> createState() => _CityDataPreviewState();
}

class _CityDataPreviewState extends State<CityDataPreview> {
  String calculateAverageTemperature(String maxTemp, String minTemp) {
    double maxTempD = double.parse(maxTemp);
    double minTempD = double.parse(minTemp);
    double average = (maxTempD + minTempD) / 2;
    return average.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    final forecastListProvider = Provider.of<ForecastProvider>(context);
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
                  widget.cityName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                Center(
                  child: Text(
                    "${calculateAverageTemperature(widget.weatherData.maxTemp, widget.weatherData.minTemp)}°",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SvgPicture.asset(
                            "assets/svg/weatherCondition.svg",
                            width: 25,
                            height: 25,
                          ),
                        ),
                        Text(
                          widget.condition.condition,
                          style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    IconButton(
                        onPressed: () => forecastListProvider
                            .deleteFromForecastList(widget.cityName),
                        icon: const Icon(
                          Icons.delete,
                          color: Color.fromARGB(255, 253, 46, 31),
                          size: 30,
                        ))
                  ],
                )
              ],
            ),
          )
        ]));
  }
}
