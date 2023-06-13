import 'package:bond/config/configs.dart';
import 'package:bond/features/auth/auth.dart';
import 'package:bond_core/core.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    final baseOptions = BaseOptions(
      connectTimeout: Duration(seconds: config('CONNECT_TIMEOUT')),
      sendTimeout: Duration(seconds: config('SEND_TIMEOUT')),
      receiveTimeout: Duration(seconds: config('RECEIVE_TIMEOUT')),
      receiveDataWhenStatusError: config('RECEIVE_DATA_WHEN_STATUS_ERROR'),
      baseUrl: config('API_BASE_URL'),
    );
    Api.extraHeaders = () {
      final token = Auth.token();
      return {
        if (token != null) 'Authorization': 'Bearer $token',
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
    it.registerLazySingleton(() => ApiClient(it()));
  }
}
