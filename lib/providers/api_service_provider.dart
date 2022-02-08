import 'package:dio/dio.dart';
import 'package:fixit/config/api.dart';
import 'package:fixit/core/service_provider.dart';
import 'package:get_it/get_it.dart';

import '../core/api_client.dart';

class ApiServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    var baseOptions = BaseOptions(
      connectTimeout: 100 * 1000,
      sendTimeout: 1000 * 1000,
      receiveTimeout: 1000 * 1000,
      receiveDataWhenStatusError: true,
      baseUrl: ApiConfig.baseUrl,
    );

    it.registerLazySingleton(() => Dio(baseOptions));
    it.registerLazySingleton(() => ApiClient(it()));
  }
}
