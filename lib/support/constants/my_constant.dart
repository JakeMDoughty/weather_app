import 'package:weather_app/support/helpers/my_utils.dart';
import 'package:flutter/material.dart';

const APP_SALT =
    "6f657048b71dae13a11d9cf94fee240094c5f40af94a08014565a7b6e45d26bf";

const GOOGLE_API_KEY = "AIzaSyD4Xgw2OtQYO8_rhYXF5lhS3dW1ys5yr08";

/// size
double height({BuildContext? context}) {
  return MediaQuery.of(context ?? MyUtils.mainContext).size.height;
}

double width({BuildContext? context}) {
  return MediaQuery.of(context ?? MyUtils.mainContext).size.width;
}

/// Colors
const Color theme = Color.fromARGB(255, 120, 16, 224);
const Color themeLight = Color.fromARGB(35, 47, 35, 1);
const Color themeGreen = Color.fromARGB(255, 153, 236, 156);
const Color themeGreenLight = Color.fromARGB(100, 153, 236, 156);
const Color themeBackground = Color.fromARGB(255, 255, 255, 255);

/// SECURE STORAGE KEY
const String SESSION_TOKEN = "SESSION_TOKEN";

/// Display Date Format
const String displayDateFormat = "dd-MM-yyyy h:mm a";

/// toolbar height
const double k_toolbar_height = 40.0;

/// margin height
const double k_height_2 = 2.0;
const double k_height_4 = 4.0;
const double k_height_6 = 6.0;
const double k_height_8 = 8.0;

/// margin width
const double k_width_4 = 4.0;
const double k_width_6 = 6.0;
const double k_width_8 = 8.0;

/// generic gap
Widget get k_height_gap_4 => SizedBox(
      height: k_height_4,
    );
Widget get k_height_gap_6 => SizedBox(
      height: k_height_6,
    );
Widget get k_height_gap_8 => SizedBox(
      height: k_height_8,
    );
Widget get k_width_gap_4 => SizedBox(
      width: k_width_4,
    );
Widget get k_width_gap_6 => SizedBox(
      width: k_width_6,
    );
