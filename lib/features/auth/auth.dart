library auth;

import 'package:bond/features/auth/data/api.dart';
import 'package:bond_cache/bond_cache.dart';
import 'package:bond_core/bond_core.dart';

import 'data/models/user.dart';

export 'data/models/user.dart';
export 'data/models/user_meta.dart';
export 'routes.dart';

class Auth {
  static bool check() => Cache.has('token');

  static User? user() => Cache.get('user');

  static String? token() => Cache.get('token');

  static Future<User?> loginAnonymous() async {
    try {
      final response = await sl<AuthApi>().anonymousLogin();
      return response.data;
    } catch (e) {
      return null;
    }
  }
}
