import 'package:flutter/material.dart';

import '../resources/bond_colors.dart';
import '../resources/bond_fonts.dart';
import '../resources/bond_styles.dart';
import '../resources/bond_text_theme.dart';

ThemeData bondLightThemeData() {
  return ThemeData(
    /// main color of the app
    primaryColor: BondColors.green,
    primaryColorLight: BondColors.cetaceanBlue,
    primaryColorDark: BondColors.greyDark,
    disabledColor: BondColors.persianGreen, // this for disabled button color
    splashColor: BondColors.greyLight,
    backgroundColor: BondColors.background,
    scaffoldBackgroundColor: BondColors.background,

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
