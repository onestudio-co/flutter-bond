import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocalDataSource {
  final SharedPreferences sharedPreferences;

  AppLocalDataSource({required this.sharedPreferences});

  static var currentLocaleKey = 'CURRENT_LOCALE';
  static var currentThemeKey = 'CURRENT_THEME';

  set currentLocale(Locale currentLocal) {
    sharedPreferences.setString(currentLocaleKey, currentLocal.languageCode);
  }

  Locale get currentLocale => Locale(
        sharedPreferences.getString(currentLocaleKey) ?? 'en',
      ); // default is English

  set currentThemeMode(ThemeMode currentLocal) {
    sharedPreferences.setString(currentThemeKey, currentLocal.value);
  }

  ThemeMode get currentThemeMode => ThemeModeExtension.fromValue(
      sharedPreferences.getString(currentThemeKey) ?? 'system');
}

extension ThemeModeExtension on ThemeMode {
  String get value {
    switch (this) {
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.light:
        return 'light';
      case ThemeMode.system:
        return 'system';
      default:
        return 'system';
    }
  }

  static ThemeMode fromValue(String value) {
    switch (value) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      case 'system':
        return ThemeMode.system;
      default:
        return ThemeMode.system;
    }
  }
}
