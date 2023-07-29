// ignore_for_file: prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherify/screens/home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherify/utilities/constants.dart';
import 'package:weatherify/services/weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    // ignore: unused_local_variable
    LocationPermission permission = await Geolocator.requestPermission();

    var weatherData =  await WeatherModel().getLocationWeather();

    // ignore: use_build_context_synchronously
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomeScreen(weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: activeBg,
      body: Center(
        child: SpinKitFadingCube(
          color: blackBg,
          size: 80.0,
        ),
      ),
    );
  }
}
