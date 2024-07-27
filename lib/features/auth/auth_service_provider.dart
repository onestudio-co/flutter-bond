import 'package:bond_core/bond_core.dart';
import 'package:get_it/get_it.dart';

import 'data/api.dart';
import 'data/models/user.dart';
import 'data/models/user_meta.dart';

class AuthServiceProvider extends ServiceProvider with ResponseDecoding {
  @override
  Future<void> register(GetIt it) async {
    it.registerFactory(() => AuthApi(it()));
  }

  @override
  Map<Type, JsonFactory> get factories => {
        User: User.fromJson,
        UserMeta: UserMeta.fromJson,
      };
}
