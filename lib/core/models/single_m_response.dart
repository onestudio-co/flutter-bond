import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'response_converter.dart';

part 'single_m_response.g.dart';

@JsonSerializable(explicitToJson: true)
class SingleMResponse<T extends Equatable, G extends Equatable>
    extends Equatable {
  @ResponseConverter()
  final T data;
  @ResponseConverter()
  final G meta;

  const SingleMResponse(this.data, this.meta);

  factory SingleMResponse.fromJson(Map<String, dynamic> json) =>
      _$SingleMResponseFromJson(json);

  factory SingleMResponse.fromResponse(Map<String, dynamic> fixture) {
    return SingleMResponse.fromJson(fixture);
  }

  Map<String, dynamic> toJson() => _$SingleMResponseToJson(this);

  @override
  List<Object> get props => [data];

  String toJsonString() => json.encode(toJson());
}
