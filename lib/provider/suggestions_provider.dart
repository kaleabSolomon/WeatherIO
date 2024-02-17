import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_io/model/suggestion.dart';
import 'package:weather_io/services/suggestions_services.dart';

class SuggestionsProvider extends ChangeNotifier {
  final _service = SuggestionService();
  CancelToken? _cancelToken;

  List<Suggestion> suggestions = [];

  Future<void> fetchSuggestions(keyword) async {
    _cancelToken?.cancel();
    _cancelToken = CancelToken();
    try {
      final res =
          await _service.getSuggestions(keyword, cancelToken: _cancelToken);
      suggestions = res;
      notifyListeners();
      print(suggestions);
    } catch (e) {
      print("Error fetching suggestions: $e");
    }
  }

  @override
  void dispose() {
    _cancelToken?.cancel();
    super.dispose();
  }
}
