import 'package:dio/dio.dart';
import 'package:fixit/config/service_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/api_client.dart';

class AppServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    it.registerLazySingleton(() => sharedPreferences);

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    it.registerLazySingleton(() => packageInfo);

    it.registerLazySingleton(() => Dio(BaseOptions(
        connectTimeout: 100 * 1000,
        sendTimeout: 1000 * 1000,
        receiveTimeout: 1000 * 1000,
        receiveDataWhenStatusError: true)));

    it.registerLazySingleton(() => ApiClient(it()));
  }
}
