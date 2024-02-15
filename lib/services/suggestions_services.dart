import 'dart:convert';

import 'package:weather_io/constants.dart';
import 'package:weather_io/model/suggestion.dart';
import "package:http/http.dart" as http;

class SuggestionService {
  Future<List<Suggestion>> getSuggestions(String query) async {
    var url =
        "http://dataservice.accuweather.com/locations/v1/cities/autocomplete?apikey=$api_key&q=$query";

    final res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      final json = jsonDecode(res.body) as List;

      List<Suggestion> suggestions =
          json.map((item) => Suggestion.fromJson(item)).toList();

      return suggestions;
    }
    return [];
  }
}
