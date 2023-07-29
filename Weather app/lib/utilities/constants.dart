import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: prefer_const_constructors
const Color activeBg = Color(0xFFFFE143);
const Color blackBg = Color(0xFF010101);

const kLocationLabel = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  fontFamily: 'RobotoMono',
);

const kDateTimeLabel = TextStyle(
  fontSize: 16,
  color: activeBg,
  fontFamily: 'Ledger',
);

const kWeatherText = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  fontFamily: 'Ledger',
);

const kTemparatureText = TextStyle(
  fontSize: 200,
  fontWeight: FontWeight.w400,
  fontFamily: 'SF-Compact',
);

const kDailySummeryText =
    TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Ledger');

const kTemperatureDescriptionText = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  fontFamily: 'Ledger',
);

const kDetailsContainerText = TextStyle(
    color: activeBg,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'Ledger');
const kDetailsContainerSubText = TextStyle(
    color: activeBg,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'RobotoMono');

const kWeeklyForecastTempAndDate = TextStyle(fontFamily: 'Ledger');

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.black26,
  icon: FaIcon(
    FontAwesomeIcons.magnifyingGlass,
    color: blackBg,
  ),
  hintText: 'Enter city name',
  hintStyle: TextStyle(color: Colors.white70),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
    borderSide: BorderSide.none,
  ),
);

const kGetWeatherButton = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w400,
  fontFamily: 'SF-Compact',
  color: activeBg,
);
