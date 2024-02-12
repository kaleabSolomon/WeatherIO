import 'package:flutter/material.dart';
import 'package:weather_io/widgets/weather_stat.dart';

class WeatherStatsToday extends StatelessWidget {
  const WeatherStatsToday({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width * 0.92,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 172, 225, 255),
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WeatherStat(
                  description: "temperature",
                  stat: "20°",
                  imagePath: "assets/temp.png"),
              WeatherStat(
                  description: "sun duration",
                  stat: "5 hrs",
                  imagePath: "assets/sun.png"),
              WeatherStat(
                  description: "wind speed",
                  stat: "20 mi/hr",
                  imagePath: "assets/wind.png"),
              WeatherStat(
                  description: "rain",
                  stat: "0.3 in",
                  imagePath: "assets/rain.png"),
            ],
          )
        ],
      ),
    );
  }
}
