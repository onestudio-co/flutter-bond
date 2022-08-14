import 'package:flutter_config/flutter_config.dart';

dynamic env(String key, [String? defaultValue]) {
  return FlutterConfig.get(key) ?? defaultValue;
}
