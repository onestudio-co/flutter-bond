import 'package:flutter/material.dart';

import '../resources/taleb_colors.dart';
import '../resources/taleb_fonts.dart';
import '../resources/taleb_styles.dart';
import '../resources/taleb_text_theme.dart';

ThemeData talebLightThemeData() {
  return ThemeData(
    /// main color of the app
    primaryColor: TalebColors.green,
    primaryColorLight: TalebColors.cetaceanBlue,
    primaryColorDark: TalebColors.greyDark,
    disabledColor: TalebColors.persianGreen, // this for disabled button color
    splashColor: TalebColors.greyLight,
    backgroundColor: TalebColors.background,
    scaffoldBackgroundColor: TalebColors.background,

    /// AppBar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: TalebColors.greyLight,
      elevation: 0,
      titleTextStyle:
          getBoldStyle(color: TalebColors.green, fontSize: TalebFontSize.s14),
    ),

    /// Button theme
    buttonTheme: const ButtonThemeData(
      shape: RoundedRectangleBorder(),
      disabledColor: TalebColors.greyLight,
      buttonColor: TalebColors.greenLight,
    ),

    /// Text Theme
    textTheme: TalebTextTheme(),
  );
}
