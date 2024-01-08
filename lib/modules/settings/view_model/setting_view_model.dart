import 'package:weather_app/models/settings.dart';
import 'package:weather_app/repositories/setting_repository.dart';
import 'package:weather_app/support/helpers/app_shared_pref.dart';
import 'package:weather_app/support/ui/base_view_%20model.dart';

class SettingViewModel extends BaseViewModel {
  final _repository = SettingRepository();
  List<Settings>? settings;

  SettingViewModel() {
    fetchData();
  }

  Future<void> fetchData() async {
    setLoading();
    settings = await _repository.getSettings();
    setComplete();
  }

  void toggle(int index) async {
    switch (index) {
      case 0:
        AppSharedPref.setTempUniInCent(
          !(settings?.elementAt(index).status ?? true),
        );

        break;
      case 1:
        AppSharedPref.setForcastLength(
          !(settings?.elementAt(index).status ?? true),
        );

        break;
      default:
    }
    await fetchData();
    notifyListeners();
  }
}
