import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_io/provider/forecast_provider.dart';
import 'package:weather_io/provider/suggestions_provider.dart';
import 'package:weather_io/theme/theme_provider.dart';
import 'package:weather_io/widgets/city_data_preview.dart';
import 'package:weather_io/widgets/custom_button.dart';
import 'package:weather_io/widgets/custom_searchbar.dart';
import 'package:weather_io/widgets/my_appbar.dart';
import 'package:weather_io/widgets/suggestion_tile.dart';

class AddLocationsPage extends StatefulWidget {
  const AddLocationsPage({super.key});

  @override
  State<AddLocationsPage> createState() => _AddLocationsPageState();
}

class _AddLocationsPageState extends State<AddLocationsPage> {
  final TextEditingController _searchController = TextEditingController();

  void toggleTheme() {
    Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
  }

  final FocusNode _searchFocusNode = FocusNode();

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPreviewLoading = Provider.of<ForecastProvider>(context).isLoading;
    final forecastData =
        Provider.of<ForecastProvider>(context, listen: false).forecastData;
    final suggestions = Provider.of<SuggestionsProvider>(context).suggestions;
    final bool hasSearched =
        Provider.of<SuggestionsProvider>(context).hasSearched;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MyAppBar(
        height: MediaQuery.of(context).size.height * 0.15,
        title: "Selected Cities",
        toggleTheme: toggleTheme,
        appBarActions: const [],
      ),
      body: Column(children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: CustomSearchBar(
                controller: _searchController,
                searchFocusNode: _searchFocusNode,
                onChanged: (value) => {
                      Provider.of<SuggestionsProvider>(context, listen: false)
                          .fetchSuggestions(value)
                    })),
        Visibility(
          visible: _searchFocusNode.hasFocus,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: hasSearched
                ? suggestions.isEmpty
                    ? 1
                    : suggestions.length
                : 0,
            itemBuilder: (context, index) {
              return hasSearched && suggestions.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.all(12),
                      child: Center(
                        child: Text(
                          "No Cities found!",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: SuggestionTile(index: index));
            },
          ),
        ),
        Visibility(
          visible: !_searchFocusNode.hasFocus && !isPreviewLoading,
          child: Expanded(
              child: GridView.builder(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  itemCount: forecastData.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3 / 4,
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16),
                  itemBuilder: (BuildContext context, int index) =>
                      CityDataPreview(
                        cityName: forecastData[index].city,
                        condition: forecastData[index].condition,
                        weatherData: forecastData[index].weatherData[0],
                      ))),
        ),
        Visibility(
            visible: !_searchFocusNode.hasFocus && isPreviewLoading,
            child: Expanded(
                child: Center(
                    child: Column(
              children: [
                SpinKitWave(
                  color: Theme.of(context).colorScheme.primary,
                  size: 60.0,
                ),
                const Text(
                  "Loading",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "ProtestStrike"),
                )
              ],
            )))),
        Visibility(
            visible: !_searchFocusNode.hasFocus,
            child: CustomButton(title: "Save Selection", btnAction: () {}))
      ]),
    );
  }
}
