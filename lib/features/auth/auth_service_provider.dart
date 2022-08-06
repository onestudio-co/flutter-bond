import 'package:bond/core/service_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasources/auth_local_data_source.dart';
import 'data/datasources/auth_remote_data_source.dart';
import 'data/models/country.dart';
import 'data/models/user.dart';
import 'data/models/user_meta.dart';
import 'data/repositories/auth_repository.dart';
import 'data/services/apple_id_login_service.dart';
import 'data/services/google_account_login_service.dart';


class AuthServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    it.registerLazySingleton(() => sharedPreferences);

    it.registerFactory(() => AuthRemoteDataSource(it.get()));
    it.registerFactory(() => AuthLocalDataSource(it.get()));

    it.registerLazySingleton(() => AuthRepository(it.get()));

    it.registerFactory(() => GoogleAccountLoginService());
    it.registerFactory(() => AppleIdLoginService());
  }

  @override
  T? responseConvert<T>(Map<String, dynamic> json) {
    switch (T) {
      case User:
        return User.fromJson(json) as T;
      case UserMeta:
        return UserMeta.fromJson(json) as T;
      case Country:
        return Country.fromJson(json) as T;
      default:
        return null;
    }
  }
}
