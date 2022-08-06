// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleResponse<T> _$SingleResponseFromJson<T extends Model>(
        Map<String, dynamic> json) =>
    SingleResponse<T>(
      data:
          ResponseConverter<T>().fromJson(json['data'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SingleResponseToJson<T extends Model>(
        SingleResponse<T> instance) =>
    <String, dynamic>{
      'data': ResponseConverter<T>().toJson(instance.data),
      'meta': instance.meta?.toJson(),
    };
