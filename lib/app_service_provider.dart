import 'package:dio/dio.dart';
import 'package:fixit/core/service_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/api_client.dart';

class AppServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    await registerSharedPreferences(it);
    await registerPackageInfo(it);

    registerApiClient(it);
  }

  void registerApiClient(GetIt it) {
    var baseOptions = BaseOptions(
      connectTimeout: 100 * 1000,
      sendTimeout: 1000 * 1000,
      receiveTimeout: 1000 * 1000,
      receiveDataWhenStatusError: true,
    );

    it.registerLazySingleton(() => Dio(baseOptions));
    it.registerLazySingleton(() => ApiClient(it()));
  }

  Future<void> registerPackageInfo(GetIt it) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    it.registerLazySingleton(() => packageInfo);
  }

  Future<void> registerSharedPreferences(GetIt it) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    it.registerLazySingleton(() => sharedPreferences);
  }
}
