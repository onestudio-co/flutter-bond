import 'package:flutter/material.dart';

import 'bond_colors.dart';
import 'bond_fonts.dart';
import 'bond_styles.dart';
import 'bond_text_theme.dart';

ThemeData bondThemeData() {
  return ThemeData(
    /// main color of the app
    primaryColor: BondColors.green,
    primaryColorLight: BondColors.cetaceanBlue,
    primaryColorDark: BondColors.greyDark,
    disabledColor: BondColors.persianGreen, // this for disabled button color
    splashColor: BondColors.greyLight,
    backgroundColor: BondColors.background,
    scaffoldBackgroundColor: BondColors.green,

    /// AppBar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: BondColors.greyLight,
      elevation: 0,
      titleTextStyle:
          getBoldStyle(color: BondColors.green, fontSize: BondFontSize.s14),
    ),

    /// Button theme
    buttonTheme: const ButtonThemeData(
      shape: RoundedRectangleBorder(),
      disabledColor: BondColors.greyLight,
      buttonColor: BondColors.greenLight,
    ),

    /// Text Theme
    textTheme: BondTextTheme(),
  );
}
