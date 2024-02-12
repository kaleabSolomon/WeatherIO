import 'package:flutter/material.dart';

class FutureForecast extends StatelessWidget {
  const FutureForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 50,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Monday",
                style: TextStyle(
                  color: Color.fromARGB(255, 103, 103, 103),
                  fontSize: 20,
                )),
            Icon(
              Icons.cloudy_snowing,
              size: 40,
              color: Color.fromARGB(255, 190, 189, 189),
            ),
            Text("24/21",
                style: TextStyle(
                  color: Color.fromARGB(255, 103, 103, 103),
                  fontSize: 18,
                ))
          ],
        ),
      ),
    );
  }
}
