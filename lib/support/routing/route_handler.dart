import 'package:weather_app/modules/dashboard/views/dashboard_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/modules/settings/views/setting_page.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return DashboardPage();
});

var settingHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return SettingPage();
  },
);

// var featuresDetialMainHandler = Handler(
//   handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
//     return FeaturesDetailMainPage(
//       isFromAuction: params["id"][0],
//       selectedFeatureName: params["data"][0],
//     );
//   },
// );
