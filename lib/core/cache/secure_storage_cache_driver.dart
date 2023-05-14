import 'dart:convert';
import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:one_studio_core/core.dart';

class SecureStorageCacheDriver implements CacheDriver {
  final FlutterSecureStorage _flutterSecureStorage;

  SecureStorageCacheDriver(this._flutterSecureStorage);

  @override
  Future<bool> flush() async {
    try {
      await _flutterSecureStorage.deleteAll();
      return true;
    } catch (error , stack) {
      log('flush error: $error , stackTrace : $stack' );
      return false;
    }
  }

  @override
  Future<bool> forget(String key) async {
    try {
      await _flutterSecureStorage.delete(key: key);
      return true;
    } catch (error , stack) {
      log('forget error: $error , stackTrace : $stack' );
      return false;
    }
  }

  @override
  CacheDriverReturnType<T> get<T>(String key,
      {defaultValue, FromJsonFactory? factory}) async {
    final stringCache = await _flutterSecureStorage.read(key: key);
    if (stringCache == null) return _handleDefaultValue(defaultValue);
    final Map<String, dynamic> jsonCache = jsonDecode(stringCache);
    final CacheData cache = CacheData.fromJson(jsonCache);
    if (cache.isValid) {
      return Future.value(factory == null ? cache.data : factory(cache.data));
    }
    _flutterSecureStorage.delete(key: key);
    return _handleDefaultValue(defaultValue);
  }

  @override
  Future<bool> has(String key) => _flutterSecureStorage.containsKey(key: key);

  @override
  Future<bool> put(String key, value, [Duration? expiredAfter]) async {
    final CacheData cache = CacheData(
      data: value,
      expiredAt: expiredAfter == null ? null : DateTime.now().add(expiredAfter),
    );
    if (value is Jsonable) {
      value = jsonEncode(value.toJson());
    } else if (value is List<Jsonable>) {
      value = jsonEncode(value.map((e) => e.toJson()).toList());
    }
    final String stringCache = jsonEncode(cache.toJson());
    try {
      await _flutterSecureStorage.write(key: key, value: stringCache);
      return true;
    } catch (error , stack) {
      log('put error: $error , stackTrace : $stack' );
      return false;
    }
  }

  //TODO:DRY
  CacheDriverReturnType<T> _handleDefaultValue<T>(dynamic defaultValue) {
    if (defaultValue is Function) {
      return Future.value(defaultValue());
    } else {
      return Future.value(defaultValue);
    }
  }
}
