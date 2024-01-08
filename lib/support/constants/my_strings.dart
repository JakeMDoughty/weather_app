import 'package:weather_app/support/helpers/my_utils.dart';

class MyString {
  //translator instance;
  static String appName = translate("decibel360");
  static String translate(String text) {
    if (MyUtils.mainContext == null) {
      return text;
    }
    return text;
  }

  static String myLocation = "My Location";
  static String hourlyForecast = "HOURLY FORECAST";
  static String daysForecast = "7-DAY FORECAST";

  /// Weather code interpretation
  static String noInterpretation = "No Interpretation";
  static String clearSky = "Clear sky";
  static String mainlyClearPartlyCloudyAndOvercast =
      "Mainly clear, partly cloudy, and overcast";
  static String fogAndDepositingRimeFog = "Fog and depositing rime fog";
  static String drizzleLightModerateAndDenseIntensity =
      "Drizzle: Light, moderate, and dense intensity";
  static String freezingDrizzleLightAndDenseIntensity =
      "Freezing Drizzle: Light and dense intensity";
  static String rainSlightModerateAndHeavyIntensity =
      "Rain: Slight, moderate and heavy intensity";
  static String freezingRainLightAndHeavyIntensity =
      "Freezing Rain: Light and heavy intensity";
  static String snowFallSlightModerateAndHeavyIntensity =
      "Snow fall: Slight, moderate, and heavy intensity";
  static String snowGrains = "Snow grains";
  static String rainShowersSlightModerateAndViolent =
      "Rain showers: Slight, moderate, and violent";
  static String snowShowersSlightAndHeavy = "Snow showers slight and heavy";
  static String thunderstormSlightOrModerate =
      "Thunderstorm: Slight or moderate";
  static String thunderstormWithSlightAndHeavyHail =
      "Thunderstorm with slight and heavy hail";
}
