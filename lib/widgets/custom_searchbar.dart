import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_io/provider/suggestions_provider.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode searchFocusNode;
  final ValueChanged<String> onChanged;
  const CustomSearchBar(
      {super.key,
      required this.controller,
      required this.searchFocusNode,
      required this.onChanged});
  @override
  Widget build(BuildContext context) {
    searchFocusNode.addListener(() {
      if (!searchFocusNode.hasFocus) {
        controller.clear();
        Provider.of<SuggestionsProvider>(context, listen: false)
            .suggestions
            .clear();
        Provider.of<SuggestionsProvider>(context, listen: false).hasSearched =
            false;
      }
    });
    return TextField(
      controller: controller,
      onChanged: (value) => onChanged(value),
      focusNode: searchFocusNode,
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
    );
  }
}
