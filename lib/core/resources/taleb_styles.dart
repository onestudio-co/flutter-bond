import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'taleb_fonts.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color? color) {
  return GoogleFonts.cairo(
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}

// Text TextStyle
TextStyle getTextStyle({required double fontSize, Color? color}) {
  return _getTextStyle(fontSize, TalebFontWeight.text, color);
}

// Regular TextStyle
TextStyle getRegularStyle({required double fontSize, Color? color}) {
  return _getTextStyle(fontSize, TalebFontWeight.regular, color);
}

// Medium TextStyle
TextStyle getMediumStyle({required double fontSize, Color? color}) {
  return _getTextStyle(fontSize, TalebFontWeight.medium, color);
}

// Bold TextStyle
TextStyle getBoldStyle({required double fontSize, required Color color}) {
  return _getTextStyle(fontSize, TalebFontWeight.bold, color);
}
