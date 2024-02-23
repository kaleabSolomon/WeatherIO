import 'package:flutter/material.dart';
import 'package:weather_io/model/forecast.dart';
import 'package:weather_io/services/forecast_service.dart';

class ForecastProvider extends ChangeNotifier {
  final _service = ForecastService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  final List<Forecast> _forecastData = [];

  List<Forecast> get forecastData => _forecastData;

  Future<void> fetchForecastData(String locationKey, String cityName) async {
    try {
      isLoading = true;
      notifyListeners();

      final res = await _service.getForecast(locationKey, cityName);
      _forecastData.add(res);

      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      print("Error fetching weather data: $e");
      notifyListeners();
    }
  }
}
