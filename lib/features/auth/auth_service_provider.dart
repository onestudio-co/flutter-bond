import 'package:get_it/get_it.dart';
import 'package:one_studio_core/core.dart';

import 'data/datasources/auth_local_data_source.dart';
import 'data/datasources/auth_remote_data_source.dart';
import 'data/models/user.dart';
import 'data/repositories/auth_repository.dart';
import 'data/services/apple_id_login_service.dart';
import 'data/services/google_account_login_service.dart';

class AuthServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    it.registerFactory(() => AuthRemoteDataSource(it()));
    it.registerLazySingleton<AuthStore>(() => AuthLocalDataSource(it()));

    it.registerLazySingleton(() => AuthRepository(it(), it()));

    it.registerFactory(() => GoogleAccountLoginService());
    it.registerFactory(() => AppleIdLoginService());
  }

  @override
  T? responseConvert<T>(Map<String, dynamic> json) {
    switch (T) {
      case User:
        return User.fromJson(json) as T;
      default:
        return null;
    }
  }
}
