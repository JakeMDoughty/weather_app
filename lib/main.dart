import 'package:weather_app/application.dart';
import 'package:weather_app/startup.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/support/helpers/app_shared_pref.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Application.setRouting();
  await AppSharedPref.initSessionManager();
  runApp(Startup());
}
