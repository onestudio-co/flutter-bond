import 'package:flutter/material.dart';
import 'package:one_studio_core/core.dart';

import '../resources/app_colors.dart';
import 'app_text_theme.dart';

ThemeData appDarkThemeData(BuildContext context) {
  return ThemeData(
    /// main color of the app
    primaryColor: AppColors.green,
    primaryColorLight: AppColors.cetaceanBlue,
    primaryColorDark: AppColors.greyDark,
    disabledColor: AppColors.persianGreen,
    // this for disabled button color
    splashColor: AppColors.greyLight,
    backgroundColor: AppColors.background,
    scaffoldBackgroundColor: AppColors.green,

    /// AppBar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: AppColors.greyLight,
      elevation: 0,
      titleTextStyle: context.textTheme.headlineSmall,
    ),

    /// Button theme
    buttonTheme: const ButtonThemeData(
      shape: RoundedRectangleBorder(),
      disabledColor: AppColors.greyLight,
      buttonColor: AppColors.greenLight,
    ),

    /// Text Theme
    textTheme: appTextTheme,
  );
}
