import 'package:flutter/material.dart';
import 'package:weather_io/model/forecast.dart';
import 'package:weather_io/services/forcast_services.dart';

class ForecastProvider extends ChangeNotifier {
  final _service = ForecastService();

  List<Forecast> forecastData = [];

  Future<void> fetchForecastData(String locationKey, String cityName) async {
    try {
      final res = await _service.getForecast(locationKey, cityName);
      print(res);
      notifyListeners();
    } catch (e) {
      print("Error fetching weatherdata: $e");
    }
  }
}
