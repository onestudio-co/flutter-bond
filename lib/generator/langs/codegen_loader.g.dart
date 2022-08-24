// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "noInternet": "No internet connection",
  "reconnect": "Reconnect",
  "homeTitle": "News",
  "categoryTitle": "E-commerce"
};
static const Map<String,dynamic> ar = {
  "noInternet": "لا يوجد اتصال بالانترنت",
  "reconnect": "اعادة الاتصال",
  "homeTitle": "الأخبار",
  "categoryTitle": "المتجر"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ar": ar};
}
