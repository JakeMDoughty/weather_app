import 'package:weather_app/application.dart';
import 'package:weather_app/support/constants/my_constant.dart';
import 'package:weather_app/support/constants/my_strings.dart';
import 'package:weather_app/support/routing/routes.dart';
import 'package:weather_app/support/ui/theme.dart';
import 'package:flutter/material.dart';

class Startup extends StatelessWidget {
  const Startup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Routes.navigatorKey,
      title: MyString.appName,

      /// Theme
      theme: ThemeData(
        fontFamily: 'Popins',
        useMaterial3: true,
        scaffoldBackgroundColor: theme, // background color of app
        colorScheme: colorScheme,
        textTheme: textTheme,
        hoverColor: Colors.transparent,
        dialogTheme: DialogTheme(backgroundColor: themeBackground),
      ),

      /// MultiLingual
      supportedLocales: [
        const Locale('en'),
        const Locale('ur'),
      ],

      //Routing
      onGenerateRoute: Application.router!.generator,
    );
  }
}
