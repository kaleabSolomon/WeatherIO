import 'package:flutter/material.dart';

class FutureForecast extends StatelessWidget {
  final String day;
  final String condition;
  final String maxTemp;
  final String minTemp;

  const FutureForecast(
      {super.key,
      required this.day,
      required this.condition,
      required this.maxTemp,
      required this.minTemp});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 40,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(day,
                style: const TextStyle(
                  color: Color.fromARGB(255, 103, 103, 103),
                  fontSize: 20,
                )),
            const Icon(
              Icons.cloudy_snowing,
              size: 40,
              color: Color.fromARGB(255, 190, 189, 189),
            ),
            Text("$maxTemp/$minTemp",
                style: const TextStyle(
                  color: Color.fromARGB(255, 103, 103, 103),
                  fontSize: 18,
                ))
          ],
        ),
      ),
    );
  }
}
