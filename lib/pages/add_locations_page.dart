import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  void toggleTheme() {
    Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        height: MediaQuery.of(context).size.height * 0.15,
        title: "City",
        toggleTheme: toggleTheme,
        appBarActions: [],
      ),
      body: Column(children: [
        Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                itemCount: 5,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 3 / 4,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 12),
                itemBuilder: (BuildContext context, int index) =>
                    const CityDataPreview())),
        CustomButton(
            title: "Add Location",
            btnColor: Color.fromARGB(255, 0, 34, 85),
            btnAction: () {})
      ]),
    );
  }
}
