import 'package:fixit/config/app.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

class ResponseConverter<T> implements JsonConverter<T, Object> {
  const ResponseConverter();

  @override
  T fromJson(Object json) {
    if (json is Map<String, dynamic>) {
      for (var provider in providers) {
        debugPrint('json ${json.runtimeType} $json');
        debugPrint('T ${T.runtimeType} $json');
        final model = provider.responseConvert<T>(json);
        if (model != null) return model;
      }
    }
    return json as T;
  }

  @override
  Object toJson(T object) {
    return object as Object;
  }
}
