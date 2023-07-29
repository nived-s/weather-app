import 'package:flutter/material.dart';
import 'screens/loading.dart';

void main() {
  runApp(const WeatherAppUI());
}

class WeatherAppUI extends StatelessWidget {
  const WeatherAppUI({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weatherify',
      home: HomePage(),
    );
  }
}