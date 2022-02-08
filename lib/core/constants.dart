import 'dart:io';

import 'package:fixit/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../injection_container.dart';
import 'assets.dart';

class Constant {
  static const int primaryColorInt = 0xFF49CBF9;
  static MaterialColor primarySwatch = Colors.lightBlue;
  static const Color primaryColor = Color(primaryColorInt);

  static const Color violetColorLight = Color(0xFFE9E9F7);
  static const Color violetColorRegular = Color(0xFFB6B6F2);
  static const Color violetColorDark = Color(0xFF7D7BFA);
  static const Color violetColorExtraDark = Color(0xFF6664CC);

  static const Color navyColorLight = Color(0xFFCFCFE5);
  static const Color navyColorRegular = Color(0xFF9A98B3);
  static const Color navyColorDark = Color(0xFF4C4C72);
  static const Color navyColorExtraDark = Color(0xFF3A3855);

  static const Color greyColorLight = Color(0xFFF9FAFB);
  static const Color greyColorRegular = Color(0xFFF2F5F7);
  static const Color greyColorDark = Color(0xFFDFE6EA);
  static const Color greyColorExtraDark = Color(0xFFBDCCD4);

  static const Color cyanColorLight = Color(0xFFDBF4FE);
  static const Color cyanColorRegular = Color(0xFF49CBF9);
  static const Color cyanColorDart = Color(0xFF41BDE8);

  static const Color redColorLight = Color(0xFFFAE7E5);
  static const Color redColorRegular = Color(0xFFFB9387);
  static const Color redColorDark = Color(0xFFE3827C);
  static const Color redColorExtraDark = Color(0xFF774342);

  static const Color yellowColorLight = Color(0xFFFDF3DC);
  static const Color yellowColorRegular = Color(0xFFFDC54F);
  static const Color yellowColorDark = Color(0xFFEBB14C);
  static const Color yellowColorExtraDark = Color(0xFF6D4C22);

  static const Color greenColorLight = Color(0xFFD7F9F4);
  static const Color greenColorRegular = Color(0xFF37E1CA);
  static const Color greenColorDark = Color(0xFF33C7B3);

  static const Color placeHolderColor = Color(0xFF8E9FA8);
  static const Color borderNormalColor = Color(0xFFECEEF4);
  static Color shadowColor = const Color(0xFF3A3954).withOpacity(0.12);

  static List<String> listNamesGender() {
    return [Strings.male, Strings.female];
  }

  static List<String> listNamesMartialState() {
    return [
      Strings.unmarried,
      Strings.married,
      Strings.absolute,
      Strings.widower
    ];
  }
}

class AppFontFamily {
  AppFontFamily? _family;

  AppFontFamily getInstance() {
    return _family ?? AppFontFamily();
  }

  static const String regular = "Famtree-Regular";
  static const String bold = "Famtree-Bold";
  static const String light = "Famtree-Light";
  static const String medium = "Famtree-Medium";
}

class Api {
  late Api? _api;

  Api getInstance() {
    _api ??= Api();
    return _api!;
  }

  static Map<String, String> headers({Map<String, String>? extra}) {
    Map<String, String> map = <String, String>{};
    map["content-type"] = "application/json";
    map["Accept"] = "application/json";
    if (sl<AuthLocalDataSource>().hasToken()) {
      map["Authorization"] = "Bearer ${sl<AuthLocalDataSource>().getToken()}";
    }
    if (Platform.isIOS || Platform.isAndroid) {
      map["app-versionName"] = sl<PackageInfo>().version;
      map["app-version"] = sl<PackageInfo>().buildNumber;
    }

    if (extra != null) {
      map.addAll(extra);
    }
    return map;
  }

  static login() {
    return "users/login";
  }

  static register() {
    return "users/register";
  }

  static completeRegistration() {
    return "users/me";
  }

  static profile() {
    return "users/profile";
  }

  static ldProfile() {
    return "users/ldProfile";
  }

  static verify() {
    return "users/verify";
  }

  static resend() {
    return "users/resend";
  }

  static forgetPassword() {
    return "users/forget_password";
  }

  static resetPassword() {
    return "users/reset_password";
  }

  static logout() {
    return "users/logout";
  }

  static delete() {
    return "users/delete";
  }

  static changPassword() {
    return "users/change_password";
  }

  static settings() {
    return "settings";
  }

  static deletionReasons() {
    return "deletion-reasons";
  }

  static loginWithSocial() {
    return "users/social-login";
  }

  static updateToken() {
    return "auth/update-token";
  }

  static refreshToken() {
    return "users/refresh_token";
  }

  static clientInfo(int id) {
    return "users/${id.toString()}/profile";
  }

  static countries() {
    return "countries";
  }
}
