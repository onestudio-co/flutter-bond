import 'package:bond/features/auth/data/models/user.dart';
import 'package:one_studio_core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource extends AuthStore<User> {
  final SharedPreferences sharedPreferences;

  static var cachedToken = 'token';

  AuthLocalDataSource(this.sharedPreferences);

  @override
  bool get hasToken => false;

  @override
  User? get user => null;

  @override
  String? get token => null;
}
