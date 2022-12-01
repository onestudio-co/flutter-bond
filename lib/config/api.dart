import 'package:bond/config/environments.dart';

class ApiConfig {
  static String baseUrl = env('API_BASE_URL');
  static int connectTimeout = env('CONNECT_TIMEOUT');
  static int sendTimeout = env('SEND_TIMEOUT');
  static int receiveTimeout = env('RECEIVE_TIMEOUT');
  static bool receiveDataWhenStatusError =
      env('RECEIVE_DATA_WHEN_STATUS_ERROR');
}
