import 'package:bond/features/auth/auth.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:one_studio_core/core.dart';

import '../config/api.dart';

class ApiServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    final baseOptions = BaseOptions(
      connectTimeout: ApiConfig.connectTimeout,
      sendTimeout: ApiConfig.sendTimeout,
      receiveTimeout: ApiConfig.receiveTimeout,
      receiveDataWhenStatusError: ApiConfig.receiveDataWhenStatusError,
      baseUrl: ApiConfig.baseUrl,
    );

    it.registerLazySingleton(() => Dio(baseOptions));
    it.registerLazySingleton(() => ApiClient(it()));

    Api.extraHeaders = () {
      return {
        'Authorization': 'Bearer ${sl<AuthStore<User>>().token}',
      };
    };
  }
}
