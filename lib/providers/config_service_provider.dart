import 'dart:core';

import 'package:get_it/get_it.dart';
import 'package:one_studio_core/core.dart';

import '../config/cache.dart';

class ConfigServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    String store = CacheConfig.defaultStore;
    Object? defaultStoreDriver = CacheConfig.stores[store]?['driver'];

    CacheConfig.stores.forEach((String key, Map<String, Object> value) {
      if (value['driver'] == defaultStoreDriver) {
        it.registerFactory<CacheDriver>(
            () => SharedPreferencesCacheDriver(it()));
      } else {
        if (value['driver'] == 'in_memory') {
          it.registerFactory<CacheDriver>(
            InMemoryCacheDriver.new,
            instanceName: 'in_memory',
          );
        }
      }
    });
  }
}
