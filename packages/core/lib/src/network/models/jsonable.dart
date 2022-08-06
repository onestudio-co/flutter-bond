import 'dart:convert';

mixin Jsonable {
  Map<String, dynamic> toJson();

  String toJsonString() => json.encode(toJson());
}
