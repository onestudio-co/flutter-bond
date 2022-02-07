import 'package:flutter_config/flutter_config.dart';

class ConfigReader {
  static String get mainUrl => FlutterConfig.get('MAIN_URL');

  static String get mainUrlV => FlutterConfig.get('MAIN_URL_V');
}
