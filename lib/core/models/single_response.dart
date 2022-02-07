import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'meta.dart';
import 'response_converter.dart';

part 'single_response.g.dart';

@JsonSerializable(explicitToJson: true)
class SingleResponse<T extends Equatable> extends Equatable {
  @ResponseConverter()
  final T data;

  final Meta meta;

  const SingleResponse({required this.data, required this.meta});

  factory SingleResponse.fromJson(Map<String, dynamic> json) =>
      _$SingleResponseFromJson(json);

  factory SingleResponse.fromResponse(Map<String, dynamic> fixture) {
    return SingleResponse.fromJson(fixture);
  }

  Map<String, dynamic> toJson() => _$SingleResponseToJson(this);

  @override
  List<Object> get props => [data, meta];

  String toJsonString() => json.encode(toJson());
}
