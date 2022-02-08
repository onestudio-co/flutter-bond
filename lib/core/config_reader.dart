import 'package:flutter_config/flutter_config.dart';

class Config {
  static String get apiUrl => env('MAIN_URL');

  static String get apiVersion => env('MAIN_URL_V', 'v1');
}

env(String key, [defaultValue]) {
  return FlutterConfig.get('MAIN_URL') ?? defaultValue;
}
