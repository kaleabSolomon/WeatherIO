import 'package:flutter/material.dart';
import 'package:weather_io/model/forecast.dart';
import 'package:weather_io/services/forecast_service.dart';

class ForecastProvider extends ChangeNotifier {
  final _service = ForecastService();

  final List<Forecast> _forecastData = [];

  List<Forecast> get forecastData => _forecastData;

  Future<void> fetchForecastData(String locationKey, String cityName) async {
    try {
      final res = await _service.getForecast(locationKey, cityName);
      _forecastData.add(res);
      notifyListeners();
    } catch (e) {
      print("Error fetching weather data: $e");
    }
  }
}
