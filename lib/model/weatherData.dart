class WeatherData {
  final String date;
  final String maxTemp;
  final String minTemp;
  final String sunDuration;
  final String windSpeed;
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
