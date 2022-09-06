import 'package:get_it/get_it.dart';
import 'package:one_studio_core/core.dart';

import 'data/datasources/auth_local_data_source.dart';
import 'data/datasources/auth_remote_data_source.dart';
import 'data/models/user.dart';
import 'data/repositories/auth_repository.dart';

class AuthServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    it.registerFactory(() => AuthRemoteDataSource(it()));
    it.registerLazySingleton<AuthStore>(() => AuthLocalDataSource(it()));

    it.registerLazySingleton(() => AuthRepository(it(), it()));
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
