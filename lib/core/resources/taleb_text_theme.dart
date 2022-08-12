import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_colors.dart';
import 'package:taleb/core/resources/taleb_fonts.dart';

import 'taleb_styles.dart';

class TalebTextTheme extends TextTheme {
  @override
  TextStyle get displayMedium =>
      getTextStyle(fontSize: TalebFontSize.s32, color: TalebColors.brightGray);

  @override
  TextStyle get bodySmall => getSemiBoldStyle(
      fontSize: TalebFontSize.s20, color: TalebColors.brightGray);

  @override
  TextStyle get headlineMedium =>
      getBoldStyle(fontSize: TalebFontSize.s20, color: TalebColors.blueRegular);

  @override
  TextStyle get headlineSmall =>
      getBoldStyle(fontSize: TalebFontSize.s16, color: TalebColors.brightGray);

  @override
  TextStyle get labelMedium => getSemiBoldStyle(
      fontSize: TalebFontSize.s16, color: TalebColors.dimGrayRegular);

  @override
  TextStyle get titleMedium => getMediumStyle(
      fontSize: TalebFontSize.s16, color: TalebColors.dimGrayRegular);

  @override
  TextStyle get labelLarge => getRegularStyle(
      fontSize: TalebFontSize.s16, color: TalebColors.dimGrayRegular);

  @override
  TextStyle get headlineLarge => getBoldStyle(
      fontSize: TalebFontSize.s14, color: TalebColors.dimGrayRegular);

  @override
  TextStyle get labelSmall => getSemiBoldStyle(
      fontSize: TalebFontSize.s14, color: TalebColors.dimGrayRegular);

  @override
  TextStyle get displayLarge => getMediumStyle(
      fontSize: TalebFontSize.s14, color: TalebColors.dimGrayRegular);

  @override
  TextStyle get bodyMedium => getBoldStyle(
      fontSize: TalebFontSize.s12, color: TalebColors.dimGrayRegular);

  @override
  TextStyle get bodyLarge => getSemiBoldStyle(
      fontSize: TalebFontSize.s12, color: TalebColors.dimGrayRegular);

  @override
  TextStyle get titleSmall => getBoldStyle(
      fontSize: TalebFontSize.s10, color: TalebColors.dimGrayRegular);

  @override
  TextStyle get displaySmall => getSemiBoldStyle(
      fontSize: TalebFontSize.s10, color: TalebColors.dimGrayRegular);
}
