import 'dart:convert';

import 'package:fixit/core/errors/exceptions.dart';
import 'package:fixit/core/extension.dart';
import 'package:fixit/core/models/single_m_response.dart';
import 'package:fixit/features/auth/data/models/user.dart';
import 'package:fixit/features/profile/data/models/profile_meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSource(this.sharedPreferences);

  static const cachedToken = 'TOKEN';
  static const cachedTokenWC = 'WC_TOKEN';
  static const cachedMobile = 'MOBILE';
  static const cachedUser = 'PROFILE';
  static const cachedDataNotification = 'CACHED_DATA_NOTIFICATIOn';

  Future<SingleMResponse<User, ProfileMeta>> getUser() async {
    final cachedUser =
        sharedPreferences.getString(AuthLocalDataSource.cachedUser);

    if (cachedUser == null) {
      throw CacheException();
    }

    return Future.value(
      SingleMResponse<User, ProfileMeta>.fromJson(
        json.decode(cachedUser),
      ),
    );
  }

  Future<bool> setUser(SingleMResponse<User, ProfileMeta> cache) {
    return sharedPreferences.setString(
      AuthLocalDataSource.cachedUser,
      json.encode(cache.toJson()),
    );
  }

  Future<bool> setToken(String token) {
    return sharedPreferences.setString(AuthLocalDataSource.cachedToken, token);
  }

  // TODO devmsh
  bool hasToken() {
    try {
      getToken();
      return true;
    } catch (e) {
      return false;
    }
  }

  String getToken() {
    final token = sharedPreferences.getString(AuthLocalDataSource.cachedToken);

    if (token == null) {
      throw CacheException();
    }

    return token;
  }

  Future<String> getMobile() async {
    final mobile =
        sharedPreferences.getString(AuthLocalDataSource.cachedMobile);

    if (mobile == null) {
      throw CacheException();
    }

    return mobile.replaceFirst("+966", "");
  }

  Future<bool> setMobile(String mobile) {
    return sharedPreferences.setString(
      AuthLocalDataSource.cachedMobile,
      mobile.englishNumbers(),
    );
  }

  Future<String> getWooCommerceToken() async {
    final token =
        sharedPreferences.getString(AuthLocalDataSource.cachedTokenWC);

    if (token == null) {
      throw CacheException();
    }

    return token;
  }

  Future<bool> setWooCommerceToken(String token) {
    return sharedPreferences.setString(
        AuthLocalDataSource.cachedTokenWC, token);
  }

  Future<bool> setNotificationReminder(DateTime dateTime) {
    return sharedPreferences.setInt(
      AuthLocalDataSource.cachedDataNotification,
      dateTime.millisecondsSinceEpoch,
    );
  }

  DateTime? getNotificationReminder() {
    if (sharedPreferences.getInt(AuthLocalDataSource.cachedDataNotification) ==
        null) {
      return null;
    }

    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
      sharedPreferences.getInt(AuthLocalDataSource.cachedDataNotification) ?? 0,
    );

    return dateTime;
  }

  Future clearAppData() async {
    await sharedPreferences.clear();
    await sharedPreferences.reload();
  }
}
