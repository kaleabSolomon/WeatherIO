import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_io/theme/theme.dart';
import 'package:weather_io/theme/theme_provider.dart';

class WeatherCard extends StatelessWidget {
  final String location;
  final String date;
  final String temperature;
  final String weatherCondition;

  const WeatherCard(
      {super.key,
      required this.location,
      required this.date,
      required this.temperature,
      required this.weatherCondition});

  String formatDate(String dateString) {
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
            child: SvgPicture.asset(
              Provider.of<ThemeProvider>(context).themeData == lightMode
                  ? "assets/svg/pattern-lightmode.svg"
                  : "assets/svg/pattern-darkmode.svg",
              alignment: Alignment.center,
              fit: BoxFit.cover,
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
                          location,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        Text(
                          formatDate(date),
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        )
                      ],
                    ),
                    Text(
                      "$temperature°",
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    Text(
                      weatherCondition,
                      style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const Icon(
                  Icons.sunny,
                  size: 90,
                  color: Colors.orange,
                )
              ],
            ),
          ),
        ]));
  }
}
