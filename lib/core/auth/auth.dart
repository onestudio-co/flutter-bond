import 'package:fixit/features/auth/data/datasources/auth_local_data_source.dart';

import '../../injection_container.dart';
import 'authenticable.dart';

class Auth {
  static bool check() {
    return sl<AuthLocalDataSource>().hasToken();
  }

  static Future<Authenticable?> user() async {
    return (await sl<AuthLocalDataSource>().getUser()).data;
  }
}
