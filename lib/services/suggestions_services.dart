import 'package:dio/dio.dart';
import 'package:weather_io/constants.dart';
import 'package:weather_io/model/suggestion.dart';

class SuggestionService {
  final Dio _dio = Dio();

  Future<List<Suggestion>> getSuggestions(String query,
      {CancelToken? cancelToken}) async {
    try {
      final res = await _dio.get(
          "http://dataservice.accuweather.com/locations/v1/cities/autocomplete",
          queryParameters: {"apikey": api_key, "q": query},
          cancelToken: cancelToken);

      if (res.statusCode == 200) {
        final List<dynamic> jsonList = res.data;

        List<Suggestion> suggestions =
            jsonList.map((json) => Suggestion.fromJson(json)).toList();
        return suggestions;
      } else {
        throw Exception('Failed to load suggestions');
      }
    } catch (e) {
      throw Exception('Failed to load suggestions: $e');
    }
  }
}
