import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:fixit/core/models/response_converter.dart';
import 'package:json_annotation/json_annotation.dart';

import 'meta.dart';

part 'list_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ListResponse<T extends Equatable> extends Equatable {
  @ResponseConverter()
  final List<T> data;
  final Meta meta;

  const ListResponse({
    required this.data,
    required this.meta,
  });

  factory ListResponse.fromJson(Map<String, dynamic> json) =>
      _$ListResponseFromJson(json);

  factory ListResponse.fromResponse(Map<String, dynamic> fixture) {
    return ListResponse.fromJson(fixture);
  }

  Map<String, dynamic> toJson() => _$ListResponseToJson(this);

  @override
  List<Object> get props => [data, meta];

  String toJsonString() => json.encode(toJson());
}
