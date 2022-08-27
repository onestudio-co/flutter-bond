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
  "categoryTitle": "E-commerce",
  "offer": {
    "offers_page": {
      "appbar_title": "Sooq",
      "hint_search_text_field": "Search in offers"
    }
  },
  "home_bottom_nav_bar": {
    "sooq": "Sooq",
    "news": "News",
    "more": "more",
    "home": "Home",
    "opportunities": "Opportunities"
  }
};
static const Map<String,dynamic> ar = {
  "noInternet": "لا يوجد اتصال بالانترنت",
  "reconnect": "اعادة الاتصال",
  "homeTitle": "الأخبار",
  "categoryTitle": "المتجر",
  "offer": {
    "offers_page": {
      "appbar_title": "السوق",
      "hint_search_text_field": "ابحث في العروض"
    }
  },
  "home_bottom_nav_bar": {
    "sooq": "السوق",
    "news": "الأخبار",
    "more": "المزيد",
    "home": "الرئيسية",
    "opportunities": "الفرص"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ar": ar};
}
