// ignore_for_file: avoid_unnecessary_containers, unnecessary_string_interpolations, prefer_adjacent_string_concatenation, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weatherify/services/weather.dart';
import 'package:weatherify/utilities/constants.dart';
import 'package:weatherify/utilities/daily_summary_card.dart';
import 'package:weatherify/utilities/weekly_container.dart';
import 'package:intl/intl.dart';
import 'city_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(this.locationWeather, {super.key});

  // ignore: prefer_typing_uninitialized_variables
  final locationWeather;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherModel weather = WeatherModel();
  late int temperature;
  late int feelsLikeTemperature;
  late int tempMin;
  late int tempMax;
  late int humidity;
  late double visibility;
  late int windSpeed;
  late int condition;
  late String cityName;
  late String weatherType;

  String todayDate = DateFormat("EEEE, dd MMMM").format(DateTime.now());

  String weeklyDay1 =
      DateFormat("dd MMM").format(DateTime.now().subtract(Duration(days: 1)));
  String weeklyDay2 =
      DateFormat("dd MMM").format(DateTime.now().subtract(Duration(days: 2)));
  String weeklyDay3 =
      DateFormat("dd MMM").format(DateTime.now().subtract(Duration(days: 3)));
  String weeklyDay4 =
      DateFormat("dd MMM").format(DateTime.now().subtract(Duration(days: 4)));

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();

      double feelsLikeTemp = weatherData['main']['feels_like'];
      feelsLikeTemperature = feelsLikeTemp.toInt();

      double minTemp = weatherData['main']['temp_min'];
      tempMin = minTemp.toInt();

      double maxTemp = weatherData['main']['temp_max'];
      tempMax = maxTemp.toInt();

      windSpeed = weatherData['wind']['speed'].toInt();

      humidity = weatherData['main']['humidity'];

      visibility = weatherData['visibility'] / 10000;

      condition = weatherData['weather'][0]['id'];
      weatherType = weatherData['weather'][0]['main'];
      cityName = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: activeBg,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                height: 70,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () async {
                          var weatherData = await weather.getLocationWeather();
                          updateUI(weatherData);
                        },
                        child: const FaIcon(
                          FontAwesomeIcons.locationArrow,
                          color: blackBg,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        '$cityName',
                        style: kLocationLabel,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () async {
                          var typedName = await
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return CityScreen();
                              },
                            ),
                          );
                          if (typedName != null) {
                            var weatherData =
                                await weather.getCityWeather(typedName);
                            updateUI(weatherData);
                          }
                        },
                        child: FaIcon(
                          FontAwesomeIcons.city,
                          color: blackBg,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: blackBg,
                ),
                margin: const EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: Text(
                    '$todayDate',
                    style: kDateTimeLabel,
                  ),
                ),
              ),
              Container(
                child: Text(
                  '$weatherType',
                  style: kWeatherText,
                ),
              ),
              Container(
                child: Text(
                  '$temperature' + '\u00b0',
                  style: kTemparatureText,
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Daily Summery',
                        style: kDailySummeryText,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Now it feels like +$feelsLikeTemperature\', actually +$temperature\'. Today the temperature is felt in the range $tempMin to $tempMax.',
                        style: kTemperatureDescriptionText,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 32),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: blackBg,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ContainerElements(
                        icon: FontAwesomeIcons.wind,
                        label: '$windSpeed' + 'km/h',
                        description: 'Wind'),
                    ContainerElements(
                        icon: FontAwesomeIcons.droplet,
                        label: '$humidity' + '%',
                        description: 'Humidity'),
                    ContainerElements(
                        icon: FontAwesomeIcons.eye,
                        label: '$visibility' + 'km',
                        description: 'Visibility'),
                  ],
                ),
              ),
              Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 26),
                  child: Column(
                    children: [
                      // weely forecast and arrow
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Weekly forecast',
                            style: kDailySummeryText,
                          ),
                          Icon(FontAwesomeIcons.arrowRightLong)
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      // box
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WeeklyForecastContainer(
                              temperature: '26' + '\u00b0',
                              icon: FontAwesomeIcons.solidSun,
                              dayAndDate: '$weeklyDay4'),
                          WeeklyForecastContainer(
                              temperature: '25' + '\u00b0',
                              icon: FontAwesomeIcons.cloudSun,
                              dayAndDate: '$weeklyDay3'),
                          WeeklyForecastContainer(
                              temperature: '27' + '\u00b0',
                              icon: FontAwesomeIcons.cloudRain,
                              dayAndDate: '$weeklyDay2'),
                          WeeklyForecastContainer(
                              temperature: '26' + '\u00b0',
                              icon: FontAwesomeIcons.cloudBolt,
                              dayAndDate: '$weeklyDay1'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
