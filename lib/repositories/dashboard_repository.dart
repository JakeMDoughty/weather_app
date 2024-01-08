import 'package:weather_app/models/weather_response_main.dart';
import 'package:weather_app/providers/services/dashboard_service_provider.dart';
import 'package:weather_app/support/helpers/my_utils.dart';

class DashboardRepository {
  final _provider = DashboardServiceProvider();
  Future<WeatherResponseMain?> getWeather(
    double lat,
    double long,
  ) async {
    if (await MyUtils().isConnectedToNetwork()) {
      return await _provider.weatherService(
        lat: lat,
        long: long,
        timeZone: 'GMT',
      );
    }

    return null;
  }
}
