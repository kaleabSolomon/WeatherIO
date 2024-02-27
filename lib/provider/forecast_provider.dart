import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:weather_io/model/forecast.dart';
import 'package:weather_io/services/forecast_service.dart';

class ForecastProvider extends ChangeNotifier {
  final _service = ForecastService();
  final Box<Forecast> _forecastBox = Hive.box("forecastBox");
  Box<Forecast> get forecastBox => _forecastBox;

  bool _isLoading = false;
  bool _isDuplicateForecast = false;

  bool get isLoading => _isLoading;
  bool get isDuplicateForecast => _isDuplicateForecast;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  set isDuplicateForecast(bool value) {
    _isDuplicateForecast = value;
    notifyListeners();
  }

  List<Forecast> _forecastData = [];
  final List<Forecast> _recentData = [];

  List<Forecast> get forecastData => _forecastData;
  List<Forecast> get recentData => _recentData;

  set forecastData(List<Forecast> value) {
    _forecastData = [...value];
    notifyListeners();
  }

  void deleteFromForecastList(String cityName) {
    forecastData.removeWhere((element) => element.city == cityName);
    notifyListeners();
  }

  Future<void> fetchForecastData(String locationKey, String cityName) async {
    try {
      isDuplicateForecast = false;
      isLoading = true;
      final List<Forecast> availableForecast = [
        ..._forecastData,
        ..._recentData
      ];

      for (Forecast forecast in availableForecast) {
        if (forecast.city == cityName) {
          isDuplicateForecast = true;
          isLoading = false;
          return;
        }
      }
      final res = await _service.getForecast(locationKey, cityName);

      _recentData.add(res);

      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      print("Error fetching forecast data: $e");
      notifyListeners();
    }
  }

  void saveForecastData() {
    try {
      for (var forecastKey in _forecastBox.keys.toList()) {
        if (!forecastData.any((forecast) => forecast.city == forecastKey)) {
          _forecastBox.delete(forecastKey); // Remove forecast from _forecastBox
        }
      }
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

  Future<void> getSavedForecastData() async {
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
