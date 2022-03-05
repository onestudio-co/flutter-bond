import 'package:fixit/injection_container.dart';

import 'drivers/cache_driver.dart';

class Cache {
  static CacheDriver cacheDriver = sl<CacheDriver>();

  static CacheDriverReturnType get(String key,
          {dynamic defaultValue, FromJsonFactory? fromJsonFactory}) =>
      cacheDriver.get(key,
          defaultValue: defaultValue, factory: fromJsonFactory);

  static Future<bool> has(String key) => cacheDriver.has(key);

  static Future<bool> put(String key, dynamic value,
          {Duration? expiredAfter}) =>
      cacheDriver.put(key, value, expiredAfter);

  static Future<void> remember(
    String key,
    Duration expiredAfter,
    CacheDriverFunctionType function,
  ) async {
    final result = await function();
    put(key, result, expiredAfter: expiredAfter);
  }

  static Future<void> rememberForever(
      String key, CacheDriverFunctionType function) async {
    final result = await function();
    put(key, result);
  }

  static void clear() => cacheDriver.clear();
}
