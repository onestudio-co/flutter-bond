import 'dart:io';

import 'package:fixit/core/cache/drivers/cache_driver.dart';
import 'package:fixit/core/cache/drivers/shared_preferences_cache_driver.dart';
import 'package:fixit/core/service_provider.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get_it/get_it.dart';

import '../config/cache.dart';
import '../injection_container.dart';

class ConfigServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      FlutterConfig.loadValueForTesting({
        "API_BASE_URL": "http://example.com/api/v2/",
      });
    } else {
      await FlutterConfig.loadEnvVariables();
    }

    var store = CacheConfig.defaultStore;
    var storeDriver = CacheConfig.stores[store]?['driver'];

    if (storeDriver == 'shared_preference') {
      it.registerFactory<CacheDriver>(() => SharedPreferencesCacheDriver(sl()));
    }
  }
}
