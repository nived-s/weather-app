import 'package:flutter/material.dart';
import 'constants.dart';

class ContainerElements extends StatelessWidget {
  const ContainerElements(
      {super.key,
      required this.icon,
      required this.label,
      required this.description});

  final IconData icon;
  final String label;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
            color: activeBg,
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Text(
                label,
                style: kDetailsContainerText,
              ),
              Text(
                description,
                style: kDetailsContainerSubText,
              ),
            ],
          ),
        ],
      ),
    );
  }
}