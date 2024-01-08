import "dart:io";

import "package:weather_app/providers/dio/api_interceptor.dart";
import "package:dio/dio.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";

class DioClient {
  static final DioClient _singleton = DioClient._internal();
  static final String SERVER_URL = "https://api.open-meteo.com/";
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  factory DioClient() {
    return _singleton;
  }

  DioClient._internal();

  final Dio dio = Dio(
    BaseOptions(
        baseUrl: SERVER_URL,
        connectTimeout: 20000,
        receiveTimeout: 25000,
        headers: {"Content-Type": "application/json"}),
  )..interceptors.add(ApiInterceptors());
}
