import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_response_main.dart';
import 'package:weather_app/providers/dio/dio_client.dart';

class WeatherServiceProvider {
  Future<WeatherResponseMain?> weatherService({
    required double lat,
    required double long,
    required String timeZone,
  }) async {
    Response response = await DioClient().dio.get(
      'v1/forecast',
      queryParameters: {
        "latitude": "${lat}",
        "longitude": "${long}",
        "current":
            'temperature_2m,relative_humidity_2m,weather_code,wind_speed_10m',
        "hourly": 'temperature_2m,weather_code,wind_speed_10m',
        "daily":
            'weather_code,temperature_2m_max,temperature_2m_min,wind_speed_10m_max,wind_gusts_10m_max',
        "temperature_unit": 'fahrenheit',
        "timezone": "${timeZone}",
      },
    );

    print(
      'service_response : $response',
    );

    final weatherResponseMain = WeatherResponseMain.fromJson(
      response.data,
    );

    return weatherResponseMain;
  }
}
