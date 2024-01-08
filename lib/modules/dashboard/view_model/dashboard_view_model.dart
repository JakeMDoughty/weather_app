import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/location_payload.dart';
import 'package:weather_app/models/weather_response_main.dart';
import 'package:weather_app/repositories/dashboard_repository.dart';
import 'package:weather_app/support/constants/my_constant.dart';
import 'package:weather_app/support/constants/my_strings.dart';
import 'package:weather_app/support/helpers/app_shared_pref.dart';
import 'package:weather_app/support/helpers/my_utils.dart';
import 'package:weather_app/support/ui/base_view_%20model.dart';

class DashboardViewModel extends BaseViewModel {
  final _repository = DashboardRepository();
  Position? _position;
  List<String>? hourlyTemperature = [];
  List<String>? hourlyTime = [];
  List<String>? hourlyWeatherIcons = [];

  ///location object
  LocationPayload? locationPayload;

  ///weather data object
  WeatherResponseMain? weatherResponseMain;

  DashboardViewModel() {
    fetchData();
  }

  /// getters
  void get update => notifyListeners();

  String get currentWindSpeed =>
      "${weatherResponseMain?.current?.windSpeed10m}${weatherResponseMain?.currentUnits?.windSpeed10m}";

  String get currentHumidity =>
      "${weatherResponseMain?.current?.relativeHumidity2m}${weatherResponseMain?.currentUnits?.relativeHumidity2m}";

  String get currentForcast => AppSharedPref.getForcastLength()
      ? "${weatherDetailByCode()} - Windspeed ${currentWindSpeed} - Humidity ${currentHumidity}"
      : weatherDetailByCode();

  String get CentOrFarText => AppSharedPref.getTempUniInCent() ? 'C' : 'F';

  String get currentTemperature =>
      "${AppSharedPref.getTempUniInCent() ? MyUtils.convertToCelsius(
          weatherResponseMain?.current?.temperature2m ?? 0.0,
        ).toStringAsFixed(0) : weatherResponseMain?.current?.temperature2m}";

  ///daily forecast
  String dayName(String date) {
    return MyUtils.getDayNameFromDate(date);
  }

  String dailyTemperature(double temp) =>
      "${AppSharedPref.getTempUniInCent() ? MyUtils.convertToCelsius(
          temp,
        ).toStringAsFixed(0) : temp}";

  /// common methods
  Future<void> fetchData() async {
    setLoading();

    await fetchLocation();

    weatherResponseMain = await _repository.getWeather(
      locationPayload?.latitude ?? 0.0,
      locationPayload?.longitutde ?? 0.0,
    );

    filterHourlyData();
    setComplete();
  }

  Future<void> fetchLocation() async {
    final locationSaved = AppSharedPref.getLocationName();

    if (locationSaved.isEmpty) {
      if (_position == null) _position = await MyUtils.determinePosition();

      final String locationName = await MyUtils.getLocationNameFromCoordinates(
        _position?.latitude ?? 0.0,
        _position?.longitude ?? 0.0,
      );

      locationPayload = LocationPayload(
        _position?.latitude ?? 0.0,
        _position?.longitude ?? 0.0,
        locationName,
      );
    } else {
      final lat = AppSharedPref.getLat();
      final lon = AppSharedPref.getLong();
      locationPayload = LocationPayload(
        lat,
        lon,
        locationSaved,
      );
    }
  }

  Future<void> updateLocationAndPref(
    LocationPayload _locationPayload,
  ) async {
    AppSharedPref.setLocationName(
      _locationPayload.locationName ?? "",
    );
    AppSharedPref.setLat(
      _locationPayload.latitude ?? 0.0,
    );
    AppSharedPref.setLong(
      _locationPayload.longitutde ?? 0.0,
    );
    await fetchData();
    notifyListeners();
  }

  String weatherDetailByCode() {
    switch (weatherResponseMain?.current?.weatherCode) {
      case 0:
        return MyString.clearSky;
      case 1:
        return MyString.mainlyClearPartlyCloudyAndOvercast;
      case 2:
        return MyString.mainlyClearPartlyCloudyAndOvercast;
      case 3:
        return MyString.mainlyClearPartlyCloudyAndOvercast;
      case 45:
        return MyString.fogAndDepositingRimeFog;
      case 48:
        return MyString.fogAndDepositingRimeFog;
      case 51:
        return MyString.drizzleLightModerateAndDenseIntensity;
      case 53:
        return MyString.drizzleLightModerateAndDenseIntensity;
      case 55:
        return MyString.drizzleLightModerateAndDenseIntensity;
      case 56:
        return MyString.freezingDrizzleLightAndDenseIntensity;
      case 57:
        return MyString.freezingDrizzleLightAndDenseIntensity;
      case 61:
        return MyString.rainSlightModerateAndHeavyIntensity;
      case 63:
        return MyString.rainSlightModerateAndHeavyIntensity;
      case 65:
        return MyString.rainSlightModerateAndHeavyIntensity;
      case 66:
        return MyString.freezingRainLightAndHeavyIntensity;
      case 67:
        return MyString.freezingRainLightAndHeavyIntensity;
      case 71:
        return MyString.snowFallSlightModerateAndHeavyIntensity;
      case 73:
        return MyString.snowFallSlightModerateAndHeavyIntensity;
      case 75:
        return MyString.snowFallSlightModerateAndHeavyIntensity;
      case 77:
        return MyString.snowGrains;
      case 80:
        return MyString.rainShowersSlightModerateAndViolent;
      case 81:
        return MyString.rainShowersSlightModerateAndViolent;
      case 82:
        return MyString.rainShowersSlightModerateAndViolent;
      case 85:
        return MyString.snowShowersSlightAndHeavy;
      case 86:
        return MyString.snowShowersSlightAndHeavy;
      case 95:
        return MyString.thunderstormSlightOrModerate;
      case 96:
        return MyString.thunderstormWithSlightAndHeavyHail;
      case 99:
        return MyString.thunderstormWithSlightAndHeavyHail;
      default:
        return MyString.noInterpretation;
    }
  }

  String weatherIconNameByCode(int? weatherCode) {
    switch (weatherCode) {
      case 0:
        return 'sunny';
      case 1:
        return 'cloudy';
      case 2:
        return 'cloudy';
      case 3:
        return 'cloudy';
      case 45:
        return 'foggy';
      case 48:
        return 'foggy';
      case 51:
        return 'light_rain';
      case 53:
        return 'light_rain';
      case 55:
        return 'light_rain';
      case 56:
        return 'light_rain';
      case 57:
        return 'light_rain';
      case 61:
        return 'rainy';
      case 63:
        return 'rainy';
      case 65:
        return 'rainy';
      case 66:
        return 'rainy';
      case 67:
        return 'rainy';
      case 71:
        return 'snowy';
      case 73:
        return 'snowy';
      case 75:
        return 'snowy';
      case 77:
        return 'snowy';
      case 80:
        return 'light_rain';
      case 81:
        return 'light_rain';
      case 82:
        return 'light_rain';
      case 85:
        return 'rainy';
      case 86:
        return 'rainy';
      case 95:
        return 'rainy';
      case 96:
        return 'hails';
      case 99:
        return 'hails';
      default:
        return '${weatherCode}';
    }
  }

  filterHourlyData() {
    hourlyTemperature = [];
    hourlyTime = [];
    hourlyWeatherIcons = [];

    DateTime currentDateTime = DateTime.now();
    List<String>? filteredTimestamps =
        weatherResponseMain?.hourly?.time?.where((timestamp) {
      DateTime time = DateTime.parse(timestamp);
      return time.isAfter(currentDateTime) &&
          time.isBefore(currentDateTime.add(Duration(hours: 24)));
    }).toList();

    List<int>? matchingIndices = filteredTimestamps?.map((filteredTimestamp) {
      return weatherResponseMain?.hourly?.time?.indexOf(filteredTimestamp) ??
          -1;
    }).toList();

    int matchingIndex = matchingIndices?.first ?? 0;

    ///temperature
    for (double temperature in weatherResponseMain?.hourly?.temperature2m
            ?.sublist(matchingIndex, matchingIndex + 24) ??
        []) {
      double val = AppSharedPref.getTempUniInCent()
          ? MyUtils.convertToCelsius(
              temperature,
            )
          : temperature;
      hourlyTemperature?.add(val.toStringAsFixed(0));
    }

    ///icons
    for (int code in weatherResponseMain?.hourly?.weatherCode
            ?.sublist(matchingIndex, matchingIndex + 24) ??
        []) {
      String iconName = weatherIconNameByCode(code);
      hourlyWeatherIcons?.add(iconName);
    }

    ///time
    for (String time in filteredTimestamps ?? []) {
      String hour = time.split('T')[1].split(':')[0];
      hourlyTime?.add(hour);
    }
  }
}
