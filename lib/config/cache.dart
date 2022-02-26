import 'package:fixit/core/cache/drivers/shared_preferences_cache_driver.dart';

class CacheConfig {
  static var defaultStore = 'shared_preference';

  static var stores = {
    'shared_preference': {
      'driver': 'shared_preference',
      'class': SharedPreferencesCacheDriver,
    },
  };
}
