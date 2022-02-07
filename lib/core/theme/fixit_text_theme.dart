import 'package:flutter/material.dart';

import '../constants.dart';

class FixitTextTheme extends TextTheme {
  @override
  TextStyle get headline3 => const TextStyle(
        fontSize: 40,
        fontFamily: AppFontFamily.regular,
      );

  @override
  TextStyle get headline4 => const TextStyle(
        fontSize: 32,
        fontFamily: AppFontFamily.regular,
      );

  @override
  TextStyle get headline5 => const TextStyle(
        fontSize: 24,
        fontFamily: AppFontFamily.regular,
      );

  @override
  TextStyle get headline6 => const TextStyle(
        fontSize: 20,
        fontFamily: AppFontFamily.regular,
      );

  @override
  TextStyle get subtitle1 => const TextStyle(
        fontSize: 17,
        fontFamily: AppFontFamily.regular,
      );

  @override
  TextStyle get subtitle2 => const TextStyle(
        fontSize: 15,
        fontFamily: AppFontFamily.regular,
      );

  @override
  TextStyle get bodyText1 => const TextStyle(
        fontSize: 17,
        fontFamily: AppFontFamily.regular,
      );

  @override
  TextStyle get bodyText2 => const TextStyle(
        fontSize: 15,
        fontFamily: AppFontFamily.regular,
      );

  @override
  TextStyle get caption => const TextStyle(
        fontSize: 12,
        fontFamily: AppFontFamily.regular,
      );

  @override
  TextStyle get button => const TextStyle(
        fontSize: 17,
        fontFamily: AppFontFamily.regular,
      );

  @override
  TextStyle get overline => const TextStyle(
        fontSize: 10,
        fontFamily: AppFontFamily.regular,
      );
}

extension CustomTextStyle on TextStyle {
  TextStyle get medium => copyWith(fontFamily: AppFontFamily.medium);

  TextStyle get regularNavy => copyWith(color: Constant.navyColorRegular);

  TextStyle get extraDarkNavy => copyWith(color: Constant.navyColorExtraDark);

  TextStyle get violetDark => copyWith(color: Constant.violetColorDark);

  TextStyle get white => copyWith(color: Colors.white);

  TextStyle get black => copyWith(color: Colors.black);

  TextStyle get extraTextLineSpace => copyWith(height: 1.5);

  TextStyle get lightFont => copyWith(fontFamily: AppFontFamily.light);

  TextStyle get extraDarkGrey => copyWith(color: Constant.greyColorExtraDark);

  TextStyle get redRegular => copyWith(color: Constant.redColorRegular);

  TextStyle get strikethrough => copyWith(
      decorationThickness: 2,
      decorationColor: Colors.white.withOpacity(0.5),
      decoration: TextDecoration.lineThrough);
}

extension CustomTextTheme on TextTheme {
  TextStyle get subtitle3 => const TextStyle(
        fontSize: 15,
        fontFamily: AppFontFamily.medium,
      );

  TextStyle get button2 => const TextStyle(
        fontSize: 12,
        fontFamily: AppFontFamily.medium,
      );

  TextStyle get bodyText3 => const TextStyle(
        fontSize: 17,
        fontFamily: AppFontFamily.medium,
      );

  TextStyle get caption2 => const TextStyle(
        fontSize: 12,
        fontFamily: AppFontFamily.medium,
      );

  TextStyle get overline2 => const TextStyle(
        fontSize: 10,
        fontFamily: AppFontFamily.medium,
      );
}
