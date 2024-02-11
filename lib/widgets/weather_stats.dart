import 'package:flutter/material.dart';

class WeatherStats extends StatelessWidget {
  final String description;
  final String imagePath;
  final String stat;

  const WeatherStats(
      {super.key,
      required this.description,
      required this.stat,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          color: Theme.of(context).colorScheme.secondary,
          imagePath,
          width: 26,
          height: 26,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(stat,
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondary, fontSize: 16))
      ],
    );
  }
}
