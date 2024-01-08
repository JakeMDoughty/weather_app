import 'package:weather_app/application.dart';
import 'package:weather_app/support/routing/route_handler.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

String root = "/";
String settings = "/settings";
String feature_detail = "/feature_detail";

class Routes {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });
    router.define(root, handler: rootHandler);
    router.define(settings, handler: settingHandler);
  }

  static navigateTo(
    String pageName, {
    String? id,
    dynamic? data,
    Function? onBackPressed,
  }) async {
    var transition = (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      return ScaleTransition(
        scale: animation,
        child: RotationTransition(
          turns: animation,
          child: child,
        ),
      );
    };
    await Application.router!.navigateTo(
      Routes.navigatorKey.currentContext!,
      "$pageName?id=$id&data=$data",
      transition: TransitionType.custom,
      transitionBuilder: transition,
      transitionDuration: const Duration(milliseconds: 600),
    );
    onBackPressed?.call();
  }
}
