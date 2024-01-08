import 'package:weather_app/support/constants/my_constant.dart';
import 'package:weather_app/support/helpers/my_utils.dart';
import 'package:weather_app/support/ui/widgets/my_text.dart';
import 'package:flutter/material.dart';

/// colors
get colorScheme => ColorScheme.fromSeed(
    seedColor: themeBackground,
    primary: theme,
    secondary: themeLight,
    brightness: Brightness.light,
    background: themeBackground);

/// Text
get textTheme => TextTheme(
      titleLarge: TextStyle(
          fontSize: 40, fontWeight: FontWeight.w900, color: themeBackground),
      titleMedium: TextStyle(fontSize: 30, color: themeBackground),
      titleSmall: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w700, color: themeBackground),
      bodyLarge: TextStyle(fontSize: 18, color: themeBackground),
      bodyMedium: TextStyle(fontSize: 13, color: themeBackground),
      bodySmall: TextStyle(fontSize: 12, color: themeBackground),
      labelLarge: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[500]),
      labelMedium: TextStyle(fontSize: 13, color: Colors.grey[500]),
      labelSmall: TextStyle(fontSize: 12, color: Colors.grey[500]),
    );

/// Button
get normalButtonStyle1 => ButtonStyle(
      textStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (Set<MaterialState> states) {
        return Theme.of(MyUtils.mainContext).textTheme.bodyMedium!;
      }),
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (Set<MaterialState> states) {
        return const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        );
      }),
      padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
          (Set<MaterialState> states) {
        return EdgeInsets.symmetric(horizontal: 16);
      }),
      backgroundColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) return themeLight;
        return theme;
      }),
      foregroundColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) return themeBackground;
        return themeBackground;
      }),
    );

get normalButtonStyle2 => ButtonStyle(
      textStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (Set<MaterialState> states) {
        return Theme.of(MyUtils.mainContext).textTheme.titleSmall!;
      }),
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (Set<MaterialState> states) {
        return const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        );
      }),
      padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
          (Set<MaterialState> states) {
        return EdgeInsets.symmetric(horizontal: 16);
      }),
    );

get normalButtonStyle2_Active => ButtonStyle(
      textStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (Set<MaterialState> states) {
        return Theme.of(MyUtils.mainContext).textTheme.titleSmall!;
      }),
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (Set<MaterialState> states) {
        return const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        );
      }),
      backgroundColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        return themeLight;
      }),
      padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
          (Set<MaterialState> states) {
        return EdgeInsets.symmetric(horizontal: 16);
      }),
    );

/// Button
get normalButtonStyle3 => ButtonStyle(
      textStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (Set<MaterialState> states) {
        return Theme.of(MyUtils.mainContext).textTheme.bodySmall!;
      }),
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (Set<MaterialState> states) {
        return const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        );
      }),
      padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
          (Set<MaterialState> states) {
        return EdgeInsets.symmetric(horizontal: 5.0);
      }),
      backgroundColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) return themeLight;
        return theme;
      }),
      foregroundColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) return themeBackground;
        return themeBackground;
      }),
    );

get normalButtonStyle4 => ButtonStyle(
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (Set<MaterialState> states) {
        return const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        );
      }),
      padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
          (Set<MaterialState> states) {
        return EdgeInsets.symmetric(horizontal: 13);
      }),
      backgroundColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) return themeGreenLight;
        return themeGreen;
      }),
      foregroundColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) return theme;
        return theme;
      }),
    );

get disableButtonStyle => ButtonStyle(
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (Set<MaterialState> states) {
        return const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        );
      }),
      padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
          (Set<MaterialState> states) {
        return EdgeInsets.symmetric(horizontal: 16);
      }),
      backgroundColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) return Colors.grey[400]!;
        return Colors.grey[400]!;
      }),
      foregroundColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) return themeBackground;
        return themeBackground;
      }),
    );

/// textfield
textFieldDecoration(String label) => InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      fillColor: Colors.white,
      filled: true,
      contentPadding: EdgeInsets.only(left: 12.0, top: 15.0, right: 15.0),
      label: MyText(
        text: label,
        textStyle: Theme.of(MyUtils.mainContext).textTheme.labelLarge,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: BorderSide(color: theme, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: BorderSide(color: themeLight, width: 1.0),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: BorderSide(color: theme, width: 1.0),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: BorderSide(color: theme, width: 1.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: BorderSide(color: Colors.red, width: 1.0),
      ),
    );
