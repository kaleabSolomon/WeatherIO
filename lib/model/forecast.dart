import "package:hive/hive.dart";

part "forecast.g.dart";

@HiveType(typeId: 0)
class Forecast extends HiveObject {
  @HiveField(0)
  final String city;
  @HiveField(1)
  final String date;
  @HiveField(2)
  final String maxTemp;
  @HiveField(3)
  final String minTemp;
  @HiveField(4)
  final String condition;
  @HiveField(5)
  final String sunDuration;
  @HiveField(6)
  final String windSpeed;
  @HiveField(7)
  final String rainHeight;

  Forecast(
      {required this.city,
      required this.date,
      required this.maxTemp,
      required this.condition,
      required this.sunDuration,
      required this.windSpeed,
      required this.rainHeight,
      required this.minTemp});
}
