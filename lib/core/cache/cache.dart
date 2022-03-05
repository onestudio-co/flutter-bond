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

  static Future<bool> add(String key, dynamic value,
      {Duration? expiredAfter}) async {
    final bool exist = await has(key);
    if (!exist) return put(key, value, expiredAfter: expiredAfter);
    return false;
  }

  static Future<bool> forever(String key, dynamic value) => put(key, value);

  static Future<bool> forget(String key) => cacheDriver.forget(key);

  static Future<bool> increment(String key, [int amount = 1]) async {
    final int value = await get(key);
    return put(key, value + amount);
  }

  static Future<bool> decrement(String key, [int amount = 1]) async {
    final int value = await get(key);
    return put(key, value - amount);
  }

  static CacheDriverReturnType pull(String key) async {
    final value = await get(key);
    await forget(key);
    return value;
  }

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

  static CacheDriver store(String storeName) =>
      sl<CacheDriver>(instanceName: storeName);

  static void clear() => cacheDriver.flush();
}
