import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'meta.dart';

part 'success_response.g.dart';

@JsonSerializable(explicitToJson: true)
class SuccessResponse extends Equatable {
  final String message;
  final Meta meta;

  const SuccessResponse(this.message, {required this.meta});

  factory SuccessResponse.fromJson(Map<String, dynamic> json) =>
      _$SuccessResponseFromJson(json);

  factory SuccessResponse.fromResponse(Map<String, dynamic> fixture) {
    return SuccessResponse.fromJson(fixture);
  }

  Map<String, dynamic> toJson() => _$SuccessResponseToJson(this);

  @override
  List<Object> get props => [message, meta];

  String toJsonString() => json.encode(toJson());
}
