// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessResponse _$SuccessResponseFromJson(Map<String, dynamic> json) =>
    SuccessResponse(
      json['message'] as String,
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SuccessResponseToJson(SuccessResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'meta': instance.meta.toJson(),
    };
