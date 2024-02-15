import 'package:flutter/material.dart';

class AutoCompleteProvider extends ChangeNotifier {
  final List<String> _suggestions = [
    "addis abeba",
    "new york",
    "california",
  ];
  List<String> get suggestions => _suggestions;
  List<String> results = [];

  filterSuggestions(String keyword) {
    results = List<String>.from(suggestions);
    if (keyword.isEmpty) {
      results = _suggestions;
    } else {
      results = _suggestions
          .where((suggestion) =>
              suggestion.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }
  }
}
