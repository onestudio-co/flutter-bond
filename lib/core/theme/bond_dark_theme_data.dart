import 'package:flutter/material.dart';

import '../resources/taleb_colors.dart';
import '../resources/taleb_fonts.dart';
import '../resources/taleb_styles.dart';
import '../resources/taleb_text_theme.dart';

ThemeData talebDarkThemeData() {
  return ThemeData(
    /// main color of the app
    primaryColor: TalebColors.blueRegular,
    primaryColorLight: TalebColors.blueRegular,
    primaryColorDark: TalebColors.blueExtraDark,
    disabledColor: TalebColors.blueDark, // this for disabled button color
    splashColor: TalebColors.greyLight,
    backgroundColor: TalebColors.blueDark,
    scaffoldBackgroundColor: TalebColors.blueDark,

    /// AppBar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: TalebColors.greyLight,
      elevation: 0,
      titleTextStyle:
          getBoldStyle(color: TalebColors.blueDark, fontSize: TalebFontSize.s14),
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
