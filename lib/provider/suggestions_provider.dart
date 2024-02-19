import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_io/model/suggestion.dart';
import 'package:weather_io/services/suggestions_services.dart';

class SuggestionsProvider extends ChangeNotifier {
  final _service = SuggestionService();
  CancelToken? _cancelToken;

  List<Suggestion> suggestions = [];
  bool _hasSearched = false;

  bool get hasSearched => _hasSearched;

  set hasSearched(bool val) {
    _hasSearched = val;
  }

  Future<void> fetchSuggestions(String keyword) async {
    _cancelToken?.cancel();
    _cancelToken = CancelToken();

    try {
      if (keyword.length < 3) {
        suggestions.clear();
        hasSearched = false;
        notifyListeners();
        return;
      }
      final res =
          await _service.getSuggestions(keyword, cancelToken: _cancelToken);
      suggestions = res;
      hasSearched = true;
      notifyListeners();
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
