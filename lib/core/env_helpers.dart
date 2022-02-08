import 'package:flutter_config/flutter_config.dart';

env(String key, [defaultValue]) {
  return FlutterConfig.get(key) ?? defaultValue;
}
