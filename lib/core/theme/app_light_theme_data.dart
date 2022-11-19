import 'package:bond/core/app_theme.dart';
import 'package:flutter/material.dart';

import '../resources/app_colors.dart';

ThemeData appLightThemeData() {
  return ThemeData(
    /// main color of the app
    primaryColor: AppColors.green,
    primaryColorLight: AppColors.cetaceanBlue,
    primaryColorDark: AppColors.greyDark,
    disabledColor: AppColors.persianGreen,
    // this for disabled button color
    splashColor: AppColors.greyLight,
    backgroundColor: AppColors.background,
    scaffoldBackgroundColor: AppColors.background,

    progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Colors.white,
    ),

    /// AppBar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: AppColors.green,
      elevation: 0,
      titleTextStyle: appTextTheme.titleLarge,
    ),

    /// Button theme
    buttonTheme: const ButtonThemeData(
      shape: RoundedRectangleBorder(),
      disabledColor: AppColors.greyLight,
      buttonColor: AppColors.greenLight,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(double.maxFinite, 48),
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 0,
      ),
    ),

    /// Text theme
    textTheme: appTextTheme,

    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: appTextTheme.labelLarge?.copyWith(
        color: AppColors.green,
      ),
      isDense: true,
      iconColor: AppColors.persianGreen,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.green,
          width: 2,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.green,
        ),
      ),
    ),
  );
}
