library auth;

import 'package:bond/features/auth/data/api.dart';
import 'package:bond_cache/bond_cache.dart';
import 'package:bond_core/bond_core.dart';

import 'data/models/user.dart';

export 'data/models/user.dart';
export 'data/models/user_meta.dart';
export 'routes.dart';

class Auth {
  static final Map<String, dynamic> _userData = {};

  static Future<void> load() async {
    if (await Cache.has('token')) {
      final value = await Cache.get<String>('token');
      _userData['token'] = value;
    }
    if (await Cache.has('user')) {
      final value = await Cache.get<User>(
        'user',
        fromJsonFactory: User.fromJson,
      );
      _userData['user'] = value;
    }
  }

  static bool check() => _userData.containsKey('token');

  static User? user() => _userData['user'];

  static String? token() => _userData['token'];

  static Future<User?> loginAnonymous() async {
    try {
      final response = await sl<AuthApi>().anonymousLogin();
      _userData['token'] = response.meta.token;
      _userData['user'] = response.data;
      return response.data;
    } catch (e) {
      return null;
    }
  }
}
