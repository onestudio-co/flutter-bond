import 'dart:core';

import 'package:bond/core/cache/secure_storage_cache_driver.dart';
import 'package:bond_cache/bond_cache.dart';
import 'package:bond_core/bond_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../config/cache.dart';

class CacheServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    final store = CacheConfig.defaultStore;
    final defaultStoreDriver = CacheConfig.stores[store]?['driver'];

    CacheConfig.stores.forEach((key, value) {
      if (value['driver'] == defaultStoreDriver) {
        it.registerFactory<CacheDriver>(
            () => SharedPreferencesCacheDriver(it()));
      } else {
        if (value['driver'] == 'in_memory') {
          it.registerFactory<CacheDriver>(
            InMemoryCacheDriver.new,
            instanceName: 'in_memory',
          );
        } else if (value['driver'] == 'secure_cache') {
          it.registerFactory(() => const FlutterSecureStorage());
          it.registerSingletonAsync(
            () => SecureStorageCacheDriver(it()).loadAll(),
            instanceName: 'secure_cache',
          );
        }
      }
    });
  }
}
