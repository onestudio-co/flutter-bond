import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_colors.dart';
import 'package:taleb/core/resources/taleb_fonts.dart';

import 'taleb_styles.dart';

class TalebTextTheme extends TextTheme {
  @override
  TextStyle get displayMedium => getMediumStyle(
      fontSize: TalebFontSize.s20, color: TalebColors.brightGray);

  @override
  TextStyle get displaySmall => getBoldStyle(
      fontSize: TalebFontSize.s16, color: TalebColors.blueRegular);

  @override
  TextStyle get headlineMedium => getMediumStyle(
      fontSize: TalebFontSize.s16, color: TalebColors.blueRegular);

  @override
  TextStyle get headlineSmall => getTextStyle(
      fontSize: TalebFontSize.s16, color: TalebColors.brightGray);

  @override
  TextStyle get titleMedium => getMediumStyle(
      fontSize: TalebFontSize.s14, color: TalebColors.dimGrayRegular);
}
