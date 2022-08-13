import 'package:one_studio_core/core.dart';

class CacheConfig {
  static String defaultStore = 'shared_preference';

  static Map<String, Map<String, Object>> stores =
      <String, Map<String, Object>>{
    'shared_preference': <String, Object>{
      'driver': 'shared_preference',
      'class': SharedPreferencesCacheDriver,
    },
    'in_memory': <String, Object>{
      'driver': 'in_memory',
      'class': InMemoryCacheDriver,
    },
  };
}
