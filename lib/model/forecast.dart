import "package:hive/hive.dart";
import "package:weather_io/model/condition.dart";
import "package:weather_io/model/weatherData.dart";

part "forecast.g.dart";

@HiveType(typeId: 0)
class Forecast extends HiveObject {
  @HiveField(0)
  final String city;
  @HiveField(1)
  final Condition condition;
  @HiveField(2)
  final List<WeatherData> weatherDate;
  Forecast(
      {required this.city, required this.condition, required this.weatherDate});
}
