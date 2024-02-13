import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:weather_io/theme/theme.dart';
import 'package:weather_io/theme/theme_provider.dart';

class CityDataPreview extends StatelessWidget {
  const CityDataPreview({super.key});

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
                  "Addis Abeba",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                Center(
                  child: Text(
                    "24°",
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
                      "Sunny",
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
