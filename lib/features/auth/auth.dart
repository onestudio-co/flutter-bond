library auth;

import 'package:bond/features/auth/data/api.dart';
import 'package:bond_core/core.dart';

import 'data/models/user.dart';

export 'data/models/user.dart';
export 'data/models/user_meta.dart';
export 'routes.dart';

class Auth {
  static bool check() => sl<AuthStore<User>>().hasToken;

  static User? user() => sl<AuthStore<User>>().user;

  static Future<User?> loginAnonymous() async {
    final response = await sl<AuthApi>().anonymousLogin();
    return response.data;
  }
}
