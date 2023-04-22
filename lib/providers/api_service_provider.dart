import 'package:bond/features/auth/auth.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:one_studio_core/core.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

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
    Api.extraHeaders = () {
      return {
        'Authorization': 'Bearer ${sl<AuthStore<User>>().token}',
      };
    };
    baseOptions.headers = Api.headers();
    final dio = Dio(baseOptions);
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90),
      );
    }
    it.registerLazySingleton(() => dio);
    it.registerLazySingleton(() => BondFire());
  }
}
