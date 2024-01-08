import 'package:flutter/material.dart';
import 'package:weather_app/support/constants/my_constant.dart';

class FilledBarView extends StatelessWidget {
  final IconData iconData;
  final double fillPercentage;

  FilledBarView({required this.iconData, required this.fillPercentage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: k_height_4,
          width: 100,
          decoration: BoxDecoration(
            color: themeBackground,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          child: Container(
            height: k_height_4,
            width: fillPercentage * 100,
            decoration: BoxDecoration(
              color: theme,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Positioned(
          left: fillPercentage * 100 - 10,
          top: 0,
          child: Container(
            height: k_height_4,
            width: 20,
            decoration: BoxDecoration(
              color: themeGreen, // Dot color (same as the fill color)
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                iconData,
                color: Colors.white, // Icon color
                size: 4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
