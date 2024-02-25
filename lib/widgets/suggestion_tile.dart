import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_io/provider/forecast_provider.dart';
import 'package:weather_io/provider/suggestions_provider.dart';

class SuggestionTile extends StatelessWidget {
  final int index;
  const SuggestionTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final suggestions = Provider.of<SuggestionsProvider>(context).suggestions;
    final forecastProvider =
        Provider.of<ForecastProvider>(context, listen: false);
    return ListTile(
      leading: const Icon(Icons.place),
      title: Text(
        "${suggestions[index].localizedName}, ${suggestions[index].country}",
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
      onTap: () {
        forecastProvider.fetchForecastData(
            suggestions[index].key, suggestions[index].localizedName);
        if (forecastProvider.isDuplicateForecast) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            padding: EdgeInsets.all(8),
            content: Text(
              "Location already exists",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Color.fromARGB(255, 210, 62, 62),
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 3),
          ));
        }

        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
