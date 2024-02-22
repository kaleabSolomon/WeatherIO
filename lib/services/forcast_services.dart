import 'package:dio/dio.dart';
import 'package:weather_io/constants.dart';
import 'package:weather_io/model/condition.dart';
import 'package:weather_io/model/forecast.dart';
import 'package:weather_io/model/weatherData.dart';

class ForecastService {
  final Dio _dio = Dio();
  Future<Forecast> getForecast(String locationKey, String city) async {
    try {
      final res = await _dio.get(
        "http://dataservice.accuweather.com/forecasts/v1/daily/5day/$locationKey",
        queryParameters: {"apikey": api_key, "details": true},
      );
      if (res.statusCode == 200) {
        final dynamic json = res.data;

        List<dynamic> dailyForecasts = json["DailyForecasts"];
        List<WeatherData> weatherData =
            dailyForecasts.map((data) => WeatherData.fromJson(data)).toList();
        Forecast forecast = Forecast(
            city: city,
            condition: Condition.fromJson(json),
            weatherDate: weatherData);

        return forecast;
      } else {
        throw Exception('Failed to load Forecast');
      }
    } catch (e) {
      throw Exception('Failed to load Forecast data: $e');
    }
  }
}
