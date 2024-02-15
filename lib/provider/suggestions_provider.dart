import 'package:flutter/material.dart';
import 'package:weather_io/model/suggestion.dart';
import 'package:weather_io/services/suggestions_services.dart';

class SuggestionsProvider extends ChangeNotifier {
  final _service = SuggestionService();

  List<Suggestion> suggestions = [];

  Future<void> fetchSuggestions(keyword) async {
    try {
      final res = await _service.getSuggestions(keyword);
      suggestions = res;
      notifyListeners();
      print(suggestions);
    } catch (e) {
      print("Error fetching suggestions: $e");
    }
  }
}
