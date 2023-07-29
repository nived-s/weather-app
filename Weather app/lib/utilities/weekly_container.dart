import 'package:flutter/material.dart';
import 'constants.dart';

class WeeklyForecastContainer extends StatelessWidget {
  const WeeklyForecastContainer(
      {super.key,
      required this.temperature,
      required this.icon,
      required this.dayAndDate});

  final String temperature;
  final IconData icon;
  final String dayAndDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 10),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 3),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          Text(
            temperature,
            style: kWeeklyForecastTempAndDate,
          ),
          const SizedBox(
            height: 5,
          ),
          Icon(icon),
          const SizedBox(
            height: 5,
          ),
          Text(
            dayAndDate,
            style: kWeeklyForecastTempAndDate,
          ),
        ],
      ),
    );
  }
}
