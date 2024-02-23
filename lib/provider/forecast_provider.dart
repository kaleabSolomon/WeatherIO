import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:weather_io/model/forecast.dart';
import 'package:weather_io/services/forecast_service.dart';

class ForecastProvider extends ChangeNotifier {
  final _service = ForecastService();
  final Box<Forecast> _forecastBox = Hive.box("forecastBox");
  Box<Forecast> get forecastBox => _forecastBox;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  final List<Forecast> _forecastData = [];
  final List<Forecast> _recentData = [];

  List<Forecast> get forecastData => _forecastData;
  List<Forecast> get recentData => _recentData;

  Future<void> fetchForecastData(String locationKey, String cityName) async {
    try {
      isLoading = true;
      notifyListeners();

      final res = await _service.getForecast(locationKey, cityName);
      _recentData.add(res);

      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      print("Error fetching weather data: $e");
      notifyListeners();
    }
  }

  void saveForecastData() {
    try {
      for (Forecast forecast in _recentData) {
        _forecastBox.put(forecast.city, forecast);
      }
      _recentData.clear();
      notifyListeners();
    } catch (e, stackTrace) {
      print("Error saving forecast data: $e");
      print(stackTrace);
    }
  }

  void getSavedForecastData() async {
    try {
      _forecastData.clear();
      notifyListeners();
      List<Forecast> forecastList = forecastBox.values.toList();
      for (Forecast forecast in forecastList) {
        _forecastData.add(forecast);
      }
      notifyListeners();
    } catch (e) {
      print("couldn't get saved forecast data: $e");
    }
  }
}
