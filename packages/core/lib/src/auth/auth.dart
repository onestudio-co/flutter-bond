import 'package:one_studio_core/src/injection/injection_container.dart';

import 'auth_store.dart';
import 'authenticable.dart';

class Auth {
  static bool check() {
    return sl<AuthStore>().hasToken;
  }

  static Future<Authenticable?> user() async {
    return sl<AuthStore>().user;
  }
}
