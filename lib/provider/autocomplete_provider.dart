import 'package:flutter/material.dart';

class AutoCompleteProvider extends ChangeNotifier {
  final List<String> _suggestions = [
    "addis abeba",
    "new york",
    "california",
    "Bishoftu",
    "Ankara",
    "Ankara",
    "Ankara",
  ];
  List<String> get suggestions => _suggestions;
  List<String> results = [];

  AutoCompleteProvider() {
    results = List<String>.from(_suggestions);
  }

  filterSuggestions(String keyword) {
    if (keyword.isEmpty) {
      results = List<String>.from(_suggestions);
    } else {
      results = _suggestions
          .where((suggestion) =>
              suggestion.toLowerCase().contains(keyword.toLowerCase()))
          .toList();

      print(results);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }
}
