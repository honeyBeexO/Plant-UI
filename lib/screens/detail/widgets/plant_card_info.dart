import 'package:flutter/material.dart';

class PlantCardInfo extends StatelessWidget {
  const PlantCardInfo({
    Key? key,
    required this.title,
    required this.iconData,
    required this.info,
  }) : super(key: key);

  final String title;
  final IconData iconData;
  final String info;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(this.iconData, size: 40.0, color: Colors.white),
        Text(
          this.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 6),
        Text(
          this.info,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
