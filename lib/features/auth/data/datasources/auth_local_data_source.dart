import 'package:one_studio_core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taleb/features/auth/data/models/user.dart';

class AuthLocalDataSource extends AuthStore<User> {
  final SharedPreferences sharedPreferences;

  static String cachedToken = 'token';

  AuthLocalDataSource(this.sharedPreferences);

  @override
  bool get hasToken => false;

  @override
  User? get user => null;

  @override
  String? get token => null;

  @override
  Future<void> clearAppData() {
    // TODO: implement clearAppData
    throw UnimplementedError();
  }

  @override
  set token(String? token) {
    // TODO: implement token
  }

  @override
  set user(User? user) {
    // TODO: implement user
  }
}
