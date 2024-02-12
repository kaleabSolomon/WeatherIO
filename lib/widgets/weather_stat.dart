import 'package:flutter/material.dart';

class WeatherStat extends StatelessWidget {
  final String description;
  final String imagePath;
  final String stat;

  const WeatherStat(
      {super.key,
      required this.description,
      required this.stat,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          color: Theme.of(context).colorScheme.primary,
          imagePath,
          width: 32,
          height: 32,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(stat,
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
                fontWeight: FontWeight.bold))
      ],
    );
  }
}
