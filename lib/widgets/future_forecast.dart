import 'package:flutter/material.dart';

class FutureForecast extends StatelessWidget {
  final String? day;
  final String? condition;
  final String? maxTemp;
  final String? minTemp;
  final bool? isNoForecast;

  const FutureForecast(
      {super.key,
      this.day,
      this.condition,
      this.maxTemp,
      this.minTemp,
      this.isNoForecast});
  String getDayOfWeek(String? dateString) {
    DateTime date = DateTime.parse(dateString!);
    List<String> daysOfWeek = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    return daysOfWeek[date.weekday - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 40,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: isNoForecast == true
            ? Center(
                child: Text(
                "No Forecast Available",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
              ))
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(getDayOfWeek(day) ?? "",
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
