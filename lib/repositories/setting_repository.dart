import 'package:weather_app/models/settings.dart';
import 'package:weather_app/support/helpers/app_shared_pref.dart';

class SettingRepository {
  Future<List<Settings>> getSettings() async {
    final showInCent = AppSharedPref.getTempUniInCent();
    final showFullLength = AppSharedPref.getForcastLength();

    return [
      Settings(showInCent, "Show In Centigrade"),
      Settings(showFullLength, "Show Full Length Forecast"),
    ];
  }
}
