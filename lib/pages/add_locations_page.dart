import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  Timer? _debounce;

  void toggleTheme() {
    Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
  }

  final FocusNode _searchFocusNode = FocusNode();

  @override
  void dispose() {
    _debounce?.cancel();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _onSearchTextChanged(String text) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      Provider.of<SuggestionsProvider>(context, listen: false)
          .fetchSuggestions(text);
    });
  }

  @override
  Widget build(BuildContext context) {
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
                onChanged: _onSearchTextChanged)),
        Visibility(
          visible: _searchFocusNode.hasFocus,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: hasSearched
                ? suggestions.isEmpty
                    ? 1
                    : Provider.of<SuggestionsProvider>(context)
                        .suggestions
                        .length
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
          visible: !_searchFocusNode.hasFocus,
          child: Expanded(
              child: GridView.builder(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  itemCount: 5,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3 / 4,
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16),
                  itemBuilder: (BuildContext context, int index) =>
                      const CityDataPreview())),
        ),
        Visibility(
            visible: !_searchFocusNode.hasFocus,
            child: CustomButton(title: "Save Selection", btnAction: () {}))
      ]),
    );
  }
}
