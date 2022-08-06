import 'package:flutter/material.dart';
import 'package:bond/core/resources/bond_fonts.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    color: color,
  );
}

// Regular TextStyle
TextStyle getTextStyle({required double fontSize, required Color color}) {
  return _getTextStyle(
      fontSize, BondFontFamily.fontFamily, BondFontWeight.regular, color);
}

// Medium TextStyle
TextStyle getMediumStyle({required double fontSize, required Color color}) {
  return _getTextStyle(
      fontSize, BondFontFamily.fontFamily, BondFontWeight.medium, color);
}

// Bold TextStyle
TextStyle getBoldStyle({required double fontSize, required Color color}) {
  return _getTextStyle(
      fontSize, BondFontFamily.fontFamily, BondFontWeight.bold, color);
}
