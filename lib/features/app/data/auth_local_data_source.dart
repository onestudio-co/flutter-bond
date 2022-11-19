import 'dart:convert';

import 'package:bond/features/auth/data/models/user.dart';
import 'package:one_studio_core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource extends AuthStore<User> {
  final SharedPreferences sharedPreferences;
  static var cachedToken = 'TOKEN';
  static const cachedUser = 'USER';

  AuthLocalDataSource(this.sharedPreferences);

  @override
  bool get hasToken => token != null;

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
  set user(User? user) {
    if (user != null) {
      sharedPreferences.setString(cachedUser, json.encode(user.toJson()));
    }
  }

  @override
  String? get token => sharedPreferences.getString(cachedToken);

  @override
  set token(String? token) {
    if (token != null) {
      sharedPreferences.setString(AuthLocalDataSource.cachedToken, token);
    }
  }

  @override
  Future<void> clearAppData([List<String>? expect]) async {
    await sharedPreferences.clear();
    await sharedPreferences.reload();
  }
}
