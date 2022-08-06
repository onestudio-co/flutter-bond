import 'package:flutter/material.dart';
import 'package:bond/core/resources/bond_colors.dart';
import 'package:bond/core/resources/bond_fonts.dart';
import 'bond_styles.dart';

class BondTextTheme extends TextTheme {
  @override
  TextStyle get displayMedium => getMediumStyle(
      fontSize: BondFontSize.s20, color: BondColors.persianGreen);

  @override
  TextStyle get displaySmall => getBoldStyle(
      fontSize: BondFontSize.s16, color: BondColors.persianGreen);

  // @override
  // TextStyle get headlineLarge => getTextStyle(
  //     fontSize: BondFontSize.s24, color: BondColors.persianGreen);
  //
  @override
  TextStyle get headlineMedium => getMediumStyle(
      fontSize: BondFontSize.s16, color: BondColors.persianGreen);

  @override
  TextStyle get headlineSmall => getTextStyle(
      fontSize: BondFontSize.s16, color: BondColors.persianGreen);

// @override
// TextStyle get titleLarge => getSemiBoldStyle(
//     fontSize: BondFontSize.s16, color: FixitColor.greyExtraDark);
//
  @override
  TextStyle get titleMedium => getMediumStyle(
      fontSize: BondFontSize.s14, color: BondColors.persianGreen);
//
// @override
// TextStyle get labelLarge => getSemiBoldStyle(
//     fontSize: BondFontSize.s14, color: BondColors.persianGreen);
//
// @override
// TextStyle get labelMedium => getTextStyle(
//     fontSize: BondFontSize.s14, color: BondColors.persianGreen);
//
// @override
// TextStyle get bodyLarge => getSemiBoldStyle(
//     fontSize: BondFontSize.s12, color: BondColors.persianGreen);
//
// @override
// TextStyle get button =>
//     getSemiBoldStyle(fontSize: BondFontSize.s12, color: FixitColor.white);
//
// @override
// TextStyle get bodyMedium => getSemiBoldStyle(
//     fontSize: BondFontSize.s10, color: BondColors.persianGreen);
}
