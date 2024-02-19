import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_io/theme/theme.dart';
import 'package:weather_io/theme/theme_provider.dart';

class WeatherCard extends StatelessWidget {
  final String? location;
  final String? date;
  final String? temperature;
  final String? weatherCondition;
  final bool? isNoForecast;

  const WeatherCard(
      {super.key,
      this.location,
      this.date,
      this.temperature,
      this.weatherCondition,
      this.isNoForecast});

  String formatDate(String dateString) {
    if (dateString.isEmpty) return "";
    DateTime date = DateTime.parse(dateString);

    DateFormat formatter = DateFormat('EEEE, dd MMMM yyyy');

    String formattedDate = formatter.format(date);

    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 220,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        width: MediaQuery.of(context).size.width * 0.92,
        child: Stack(children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: ColorFiltered(
              colorFilter: isNoForecast == true
                  ? const ColorFilter.mode(Colors.grey, BlendMode.saturation)
                  : const ColorFilter.mode(Colors.transparent, BlendMode.color),
              child: SvgPicture.asset(
                Provider.of<ThemeProvider>(context).themeData == lightMode
                    ? "assets/svg/pattern-lightmode.svg"
                    : "assets/svg/pattern-darkmode.svg",
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          location ?? "",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        Text(
                          formatDate(date ?? ""),
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        )
                      ],
                    ),
                    Text(
                      temperature != null ? "$temperature°" : "",
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    Text(
                      weatherCondition ?? "",
                      style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Icon(
                  isNoForecast != true ? Icons.sunny : Icons.unpublished_sharp,
                  size: 90,
                  color: isNoForecast != true ? Colors.orange : Colors.grey,
                )
              ],
            ),
          ),
        ]));
  }
}
