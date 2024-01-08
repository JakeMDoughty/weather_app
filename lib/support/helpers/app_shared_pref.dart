import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPref {
  /// PREF
  static const String PREF_LAT_KEY = "PREF_LAT_KEY";
  static const String PREF_LONG_KEY = "PREF_LONG_KEY";
  static const String PREF_USER_LOCATION_KEY = "PREF_USER_LOCATION_KEY";
  static const String PREF_FORECAST_FULL_LENGTH_KEY =
      "PREF_FORECAST_FULL_LENGTH_KEY";
  static const String PREF_TEMPERATURE_UNIT_CENT = "PREF_TEMPERATURE_UNIT_CENT";

  static Future<bool> initSessionManager() async {
    var _prefs = await SharedPreferences.getInstance();
    Get.put(_prefs);
    return true;
  }

  /// Forcast Length
  static setTempUniInCent(bool showInCent) {
    SharedPreferences _pref = Get.find();
    _pref.setBool(PREF_TEMPERATURE_UNIT_CENT, showInCent);
  }

  static bool getTempUniInCent() {
    SharedPreferences _pref = Get.find();
    return _pref.getBool(PREF_TEMPERATURE_UNIT_CENT) ?? false;
  }

  /// Forcast Length
  static setForcastLength(bool showFullLength) {
    SharedPreferences _pref = Get.find();
    _pref.setBool(PREF_FORECAST_FULL_LENGTH_KEY, showFullLength);
  }

  static bool getForcastLength() {
    SharedPreferences _pref = Get.find();
    return _pref.getBool(PREF_FORECAST_FULL_LENGTH_KEY) ?? false;
  }

  ///Location Name
  static setLocationName(String locationName) {
    SharedPreferences _pref = Get.find();
    _pref.setString(PREF_USER_LOCATION_KEY, locationName);
  }

  static String getLocationName() {
    SharedPreferences _pref = Get.find();
    return _pref.getString(PREF_USER_LOCATION_KEY) ?? "";
  }

  ///Lat
  static setLat(double lat) {
    SharedPreferences _pref = Get.find();
    _pref.setDouble(PREF_LAT_KEY, lat);
  }

  static double getLat() {
    SharedPreferences _pref = Get.find();
    return _pref.getDouble(PREF_LAT_KEY) ?? 0.0;
  }

  ///Long
  static setLong(double long) {
    SharedPreferences _pref = Get.find();
    _pref.setDouble(PREF_LONG_KEY, long);
  }

  static double getLong() {
    SharedPreferences _pref = Get.find();
    return _pref.getDouble(PREF_LONG_KEY) ?? 0.0;
  }
}
