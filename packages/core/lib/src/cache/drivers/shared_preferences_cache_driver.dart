import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'cache_driver.dart';

class SharedPreferencesCacheDriver implements CacheDriver {
  final SharedPreferences _sharedPreferences;

  SharedPreferencesCacheDriver(this._sharedPreferences);

  @override
  CacheDriverReturnType get(String key,
      {dynamic defaultValue, FromJsonFactory? factory}) {
    final String? stringCache = _sharedPreferences.getString(key);
    if (stringCache == null) return _handleDefaultValue(defaultValue);
    final Map<String, dynamic> jsonCache = jsonDecode(stringCache);
    final CacheData cache = CacheData.fromJson(jsonCache);
    if (cache.isValid) {
      return Future.value(factory == null ? cache.data : factory(cache.data));
    }
    _sharedPreferences.remove(key);
    return _handleDefaultValue(defaultValue);
  }

  @override
  Future<bool> has(String key) async {
    final Map<String, dynamic>? results = await get(key);
    return results != null;
  }

  @override
  Future<bool> put(String key, dynamic value, [Duration? expiredAfter]) async {
    final CacheData cache = CacheData(
      data: value,
      expiredAt: expiredAfter == null ? null : DateTime.now().add(expiredAfter),
    );
    final String stringCache = jsonEncode(cache.toJson());
    return _sharedPreferences.setString(key, stringCache);
  }

  @override
  Future<bool> forget(String key) => _sharedPreferences.remove(key);

  @override
  Future<bool> flush() => _sharedPreferences.clear();

  CacheDriverReturnType _handleDefaultValue(dynamic defaultValue) {
    if (defaultValue is Function) {
      return Future.value(defaultValue());
    } else {
      return Future.value(defaultValue);
    }
  }
}
