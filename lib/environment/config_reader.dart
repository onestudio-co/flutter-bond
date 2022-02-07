import 'dart:io';

import 'environment.dart';

class ConfigReader {
  late ConfigReader? _configReader;

  ConfigReader getInstance() {
    _configReader ??= ConfigReader();
    return _configReader!;
  }

  static Map<String, dynamic> _config = {};

  static Future<void> initialize() async {
    if (Platform.isIOS || Platform.isAndroid) {
      var env = await Environment.current;
      if (env == EnvironmentType.clientProduction) {
        _config = {
          "main_url": "https://dashboard.fixit.app/",
          "main_url_v": "v2",
        };
      } else if (env == EnvironmentType.clientStaging) {
        _config = {
          "main_url": "https://backend-develop.fixit.app/",
          "main_url_v": "v2",
        };
      }
    } else {
      _config = {
        "main_url": "https://dashboard.fixit.app/",
        "main_url_v": "v2",
      };
    }
  }

  static String mainUrl() {
    return _config['main_url'] as String;
  }

  static String mainUrlV() {
    if (!_config.containsKey("main_url_v")) {
      return "v1";
    }
    return _config['main_url_v'] as String;
  }
}
