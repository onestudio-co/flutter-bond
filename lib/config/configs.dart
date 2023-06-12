import 'api.dart';

final configs = {
  ...apiConfigs,
};

dynamic config(String key) {
  if (!configs.containsKey(key)) {
    throw Exception('Config $key not found');
  }
  return configs[key];
}
