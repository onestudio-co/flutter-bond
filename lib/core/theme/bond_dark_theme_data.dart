import 'package:flutter/material.dart';
import 'package:one_studio_core/core.dart';

import '../resources/bond_colors.dart';
import 'bond_text_theme.dart';

ThemeData bondDarkThemeData(BuildContext context) {
  return ThemeData(
    /// main color of the app
    primaryColor: BondColors.green,
    primaryColorLight: BondColors.cetaceanBlue,
    primaryColorDark: BondColors.greyDark,
    disabledColor: BondColors.persianGreen,
    // this for disabled button color
    splashColor: BondColors.greyLight,
    backgroundColor: BondColors.background,
    scaffoldBackgroundColor: BondColors.green,

    /// AppBar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: BondColors.greyLight,
      elevation: 0,
      titleTextStyle: context.textTheme.headlineSmall,
    ),

    /// Button theme
    buttonTheme: const ButtonThemeData(
      shape: RoundedRectangleBorder(),
      disabledColor: BondColors.greyLight,
      buttonColor: BondColors.greenLight,
    ),

    /// Text Theme
    textTheme: bondTextTheme,
  );
}
