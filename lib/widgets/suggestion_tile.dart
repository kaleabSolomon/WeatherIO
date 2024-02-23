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
    return ListTile(
      leading: const Icon(Icons.place),
      title: Text(
        "${suggestions[index].localizedName}, ${suggestions[index].country}",
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
      onTap: () {
        Provider.of<ForecastProvider>(context, listen: false).fetchForecastData(
            suggestions[index].key, suggestions[index].localizedName);

        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
