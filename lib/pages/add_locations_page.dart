import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_io/provider/suggestions_provider.dart';
import 'package:weather_io/theme/theme_provider.dart';
import 'package:weather_io/widgets/city_data_preview.dart';
import 'package:weather_io/widgets/custom_button.dart';
import 'package:weather_io/widgets/my_appbar.dart';

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
          child: TextField(
            controller: _searchController,
            onChanged: (value) {
              if (value.length > 2) {
                _onSearchTextChanged(value);
              }
            },
            focusNode: _searchFocusNode,
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
            decoration: InputDecoration(
                hintText: "Search Cities",
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 171, 171, 171),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 20),
                filled: true,
                fillColor: Theme.of(context).colorScheme.secondary,
                prefixIcon: Icon(
                  Icons.place,
                  color: Theme.of(context).colorScheme.primary,
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20))),
          ),
        ),
        Visibility(
          visible: _searchFocusNode.hasFocus,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: Provider.of<SuggestionsProvider>(context)
                .suggestions
                .length, // Number of autocomplete suggestions
            itemBuilder: (context, index) {
              // Build your autocomplete suggestion itema
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: ListTile(
                      leading: const Icon(Icons.place),
                      title: Text(Provider.of<SuggestionsProvider>(context)
                          .suggestions[index]
                          .localizedName),
                      onTap: () {
                        // Handle suggestion tap
                      },
                    ),
                  ),
                ],
              );
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
//TODO: aborting api call