import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weatherify/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: activeBg,
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const FaIcon(
                    FontAwesomeIcons.arrowLeft,
                    size: 35,
                    color: blackBg,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: TextField(
                  decoration: kTextFieldInputDecoration,
                  cursorColor: Colors.grey[600],
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: blackBg,
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: blackBg,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                  child: const Text(
                    'Get Weather',
                    style: kGetWeatherButton,
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
