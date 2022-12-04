import 'package:flutter/material.dart';

class AppImagesAssets {
  static const String logo = 'assets/images/app_logo.svg';
  static const String homeBondLight = 'assets/images/home_bond.png';
  static const String homeBondDark = 'assets/images/home_bond_dark.png';

  static String homeBond(Brightness mode) =>
      mode == Brightness.dark ? homeBondDark : homeBondLight;
}
