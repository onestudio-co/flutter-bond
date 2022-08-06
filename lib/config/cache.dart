import 'package:one_studio_core/core.dart';

class CacheConfig {
  static var defaultStore = 'shared_preference';

  static var stores = {
    'shared_preference': {
      'driver': 'shared_preference',
      'class': SharedPreferencesCacheDriver,
    },
    'in_memory': {
      'driver': 'in_memory',
      'class': InMemoryCacheDriver,
    },
  };
}
