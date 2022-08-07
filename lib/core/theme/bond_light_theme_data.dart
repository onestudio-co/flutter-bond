import 'package:flutter/material.dart';

import '../resources/taleb_colors.dart';
import '../resources/taleb_fonts.dart';
import '../resources/taleb_styles.dart';
import '../resources/taleb_text_theme.dart';

ThemeData talebLightThemeData() {
  return ThemeData(
    /// main color of the app
    primaryColor: TalebColors.blueDark,
    primaryColorLight: TalebColors.blueDark,
    primaryColorDark: TalebColors.blueDark,
    disabledColor: TalebColors.blueDark, // this for disabled button color
    splashColor: TalebColors.greyLight,
    backgroundColor: TalebColors.customeBackground,
    scaffoldBackgroundColor: TalebColors.customeBackground,

    /// AppBar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: TalebColors.customeBackground,
      elevation: 0,
      titleTextStyle:
          getBoldStyle(color: TalebColors.customeAppbarColor, fontSize: TalebFontSize.s16),
          iconTheme: const IconThemeData(color: TalebColors.customeAppbarColor)
    ),

    /// Button theme
    buttonTheme: const ButtonThemeData(
      shape: RoundedRectangleBorder(),
      disabledColor: TalebColors.greyLight,
      buttonColor: TalebColors.blueDark,
    ),

    /// Text Theme
    textTheme: TalebTextTheme(),
  );
}
