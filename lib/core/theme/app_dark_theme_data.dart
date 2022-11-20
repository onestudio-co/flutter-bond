import 'package:flutter/material.dart';

import 'app_text_theme.dart';

ThemeData appDarkThemeData() {
  return ThemeData(
    colorScheme: const ColorScheme(
      primary: Color.fromRGBO(50, 45, 120, 1),
      secondary: Color.fromRGBO(34, 193, 224, 1),
      surface: Colors.white54,
      background: Colors.white54,
      error: Color.fromRGBO(241, 95, 109, 1),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.white,
      onBackground: Colors.white,
      onError: Colors.white,
      brightness: Brightness.dark,
    ),
    brightness: Brightness.dark,

    scaffoldBackgroundColor: const Color.fromRGBO(50, 45, 120, 0.4),

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.white,
    ),

    /// AppBar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: const Color.fromRGBO(50, 45, 120, 1),
      elevation: 0,
      titleTextStyle: appTextTheme.titleLarge,
    ),

    /// Button theme
    buttonTheme: const ButtonThemeData(
      shape: RoundedRectangleBorder(),
      disabledColor: Color.fromRGBO(34, 193, 224, 0.1),
      buttonColor: Color.fromRGBO(34, 193, 224, 1),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(double.maxFinite, 48),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromRGBO(50, 45, 120, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 0,
      ),
    ),

    popupMenuTheme: PopupMenuThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: appTextTheme.subtitle2?.copyWith(
        color: Colors.white,
      ),
    ),

    /// Text theme
    textTheme: appTextTheme,

    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: appTextTheme.labelLarge?.copyWith(
        color: Colors.white,
      ),
      labelStyle: appTextTheme.labelLarge?.copyWith(
        color: Colors.white,
      ),
      isDense: true,
      iconColor: const Color.fromRGBO(34, 193, 224, 1),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Color.fromRGBO(34, 193, 224, 1),
          width: 2,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Color.fromRGBO(50, 45, 120, 1),
        ),
      ),
    ),
  );
}
