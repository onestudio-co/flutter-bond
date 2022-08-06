import 'package:dio/dio.dart';
import 'package:bond/core/service_provider.dart';
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
      baseUrl: 'https://backend-develop.famcare.app/api/v2',
    );

    it.registerLazySingleton(() => Dio(baseOptions));
    it.registerLazySingleton(() => ApiClient(it()));
  }
}
