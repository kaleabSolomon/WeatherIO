import "package:hive/hive.dart";

part "weatherData.g.dart";

@HiveType(typeId: 2)
class WeatherData extends HiveObject {
  @HiveField(0)
  final String date;
  @HiveField(1)
  final String maxTemp;
  @HiveField(2)
  final String minTemp;
  @HiveField(3)
  final String sunDuration;
  @HiveField(4)
  final String windSpeed;
  @HiveField(5)
  final String rainHeight;

  WeatherData(
      {required this.date,
      required this.maxTemp,
      required this.minTemp,
      required this.sunDuration,
      required this.windSpeed,
      required this.rainHeight});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
        date: json["Date"],
        maxTemp: json["Temperature"]["Maximum"]["Value"].toString(),
        minTemp: json["Temperature"]["Minimum"]["Value"].toString(),
        sunDuration: json["HoursOfSun"].toString(),
        windSpeed: json["Day"]["Wind"]["Speed"]["Value"].toString(),
        rainHeight: json["Day"]["Rain"]["value"].toString());
  }
}
