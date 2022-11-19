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
    textTheme: appTextTheme,

    /// Text Theme
  );
}
