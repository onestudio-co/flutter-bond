import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:one_studio_core/core.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../config/api.dart';

class ApiServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    BaseOptions baseOptions = BaseOptions(
      connectTimeout: 100 * 1000,
      sendTimeout: 1000 * 1000,
      receiveTimeout: 1000 * 1000,
      receiveDataWhenStatusError: true,
      baseUrl: ApiConfig.baseUrl,
    );
    it.registerLazySingleton(() => Dio(baseOptions));

    if (!kReleaseMode) {
      it<Dio>().interceptors.add(
            PrettyDioLogger(
              requestHeader: true,
              requestBody: true,
              responseBody: true,
              responseHeader: false,
              compact: false,
            ),
          );
    }
    it.registerLazySingleton(() => ApiClient(it()));
  }
}
