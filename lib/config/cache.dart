import 'package:bond/core/cache/secure_storage_cache_driver.dart';
import 'package:bond_core/core.dart';

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
    'secure_cache': {
      'driver': 'secure_cache',
      'class': SecureStorageCacheDriver,
    },
  };
}
