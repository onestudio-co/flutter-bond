import 'dart:convert';

import 'package:bond/features/auth/data/models/user.dart';
import 'package:one_studio_core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource extends AuthStore<User> {
  final SharedPreferences sharedPreferences;

  static const cachedToken = 'TOKEN';
  static const cachedUser = 'USER';
  static const verificationTime = 'VERIFICATION_AT';
  static const userVerified = 'USER_VERIFIED';

  AuthLocalDataSource(this.sharedPreferences);

  @override
  set token(String? token) {
    if (token != null) {
      sharedPreferences.setString(AuthLocalDataSource.cachedToken, token);
    }
  }

  @override
  String? get token => sharedPreferences.getString(cachedToken);

  @override
  set user(User? user) {
    if (user != null) {
      sharedPreferences.setString(cachedUser, json.encode(user.toJson()));
    }
  }

  @override
  User? get user {
    final userString = sharedPreferences.getString(cachedUser);
    if (userString != null) {
      final user = User.fromJson(json.decode(userString));
      return user;
    }
    return null;
  }

  @override
  Future<void> clearAppData([List<String>? expect]) async {
    if (expect != null) {
      final keys =
          sharedPreferences.getKeys().where((key) => !expect.contains(key));
      for (final key in keys) {
        await sharedPreferences.remove(key);
      }
    } else {
      await sharedPreferences.clear();
    }
  }
}
