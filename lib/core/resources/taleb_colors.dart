import 'package:flutter/material.dart';

class TalebColors {
  static const Color white = Colors.white;
  //* Blue
  static const Color blueRegular = Color(0xFF3FC8E8);
  static const Color blueDark = Color(0xFF37B0CC);
  static const Color blueExtraDark = Color(0xFF2A8499);
  //* Yellow
  static const Color yellowRegular = Color(0xFFFFBB00);
  static const Color yellowDark = Color(0xFFCCA400);
  static const Color yellowExtraDark = Color(0xFF997B00);
  //* Dim Gray
  static const Color dimGrayRegular = Color(0xFF65617A);
  static const Color dimGrayDark = Color(0xFFA9A2CC);
  static const Color dimGrayExtraDark = Color(0xFF7F7A99);
  //* Green
  static const Color porcelain = Color(0xFFEDF3F5);
  static const Color chathamsBlue = Color(0xFF1C5866);
  static const Color elephant = Color(0xFF113740);
  static const Color darkJungleGreen = Color(0xFF242424);
  //* White
  static const Color brightGray = Color(0xFFE8F0F2);
  static const Color greyRegular = Color(0xFFC8CBCC);
  static const Color greyLight = Color(0xFFF2F1ED);
  static const Color gainsBoro = Color(0xFFE8F0F2);
  static const Color ghostWhite = Color(0xFFF8F7FB);
  static const Color spanishGray = Color(0xFF999999);
  static const Color metallicSilver = Color(0xFFB4C8CC);
  static const Color coolGrey = Color(0xFF92A2A6);
  static const Color paleAqua = Color(0xFFBFD4D9);
  static const Color custome1 = Color(0xFFEBEFF0);
  static const Color custome2 = Color(0xff999999);
}

extension CustomTextStyle on TextStyle {
  TextStyle get metallicSilver => copyWith(color: TalebColors.metallicSilver);
  TextStyle get chathamsBlue => copyWith(color: TalebColors.chathamsBlue);
  TextStyle get white => copyWith(color: TalebColors.white);
  TextStyle get coolGrey => copyWith(color: TalebColors.coolGrey);
  TextStyle get paleAqua => copyWith(color: TalebColors.paleAqua);
  TextStyle get spanishGray => copyWith(color: TalebColors.spanishGray);
  TextStyle get elephant => copyWith(color: TalebColors.elephant);
  TextStyle get darkJungleGreen => copyWith(color: TalebColors.darkJungleGreen);
  TextStyle get custome2 => copyWith(color: TalebColors.custome2);
  TextStyle get blueDark => copyWith(color: TalebColors.blueDark);
}
