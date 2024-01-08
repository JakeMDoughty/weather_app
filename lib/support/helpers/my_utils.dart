import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/providers/request/generic_request.dart';
import 'package:weather_app/support/constants/my_constant.dart';
import 'package:weather_app/support/constants/my_strings.dart';
import 'package:weather_app/support/routing/routes.dart';
import 'package:connectivity/connectivity.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:crypto/crypto.dart';

class MyUtils {
  static String dateTimeDisplayFormat = "EEE d MMM,yyyy hh:mm aa";

  static get mainContext => Routes.navigatorKey.currentContext;
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Future<String> getPrefString(String key) async {
    final SharedPreferences prefs = await _prefs;
    return (prefs.getString(key) ?? "");
  }

  static void setPrefString(String key, String value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(key, value);
  }

  static Future<double> getPrefDouble(String key) async {
    final SharedPreferences prefs = await _prefs;
    return (prefs.getDouble(key) ?? 0.0);
  }

  static void setPrefDouble(String key, double value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setDouble(key, value);
  }

  static Future<bool> getPrefBool(String key) async {
    final SharedPreferences prefs = await _prefs;
    return (prefs.getBool(key) ?? false);
  }

  static void setPrefBool(String key, bool value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool(key, value);
  }

  static showSnackBarInfo(BuildContext context, String text) {
    showTopSnackBar(
      context,
      CustomSnackBar.info(
        message: text,
      ),
    );
  }

  static showSnackBarSuccess(String text) {
    showTopSnackBar(
      mainContext,
      CustomSnackBar.success(
        message: text,
      ),
    );
  }

  static showSnackBarError(String text) {
    showTopSnackBar(
      mainContext,
      CustomSnackBar.error(
        message: text,
      ),
    );
  }

  static String displayDateTimeFromDevice() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat(dateTimeDisplayFormat).format(now);
    return formattedDate.toString();
  }

  Future<bool> isConnectedToNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      return true;
    }

    showSnackBarInfo(mainContext, MyString.translate("Connection not found"));
    return false;
  }

  static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  static Future<String> getLocationNameFromCoordinates(
      double lat, double long) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        return "${placemark.subLocality!.isEmpty ? placemark.thoroughfare : placemark.subLocality}, ${placemark.subAdministrativeArea}";
      } else {
        return 'Location not found';
      }
    } catch (e) {
      return 'Error fetching location';
    }
  }

  static double convertToCelsius(double fahrenheit) {
    return (fahrenheit - 32) * 5 / 9;
  }

  static String getDayNameFromDate(String yyyymmdd) {
    DateTime dateTime = DateTime.parse(yyyymmdd);
    return DateFormat('EEEE').format(dateTime);
  }
}
