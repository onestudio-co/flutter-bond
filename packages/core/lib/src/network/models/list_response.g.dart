// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListResponse<T> _$ListResponseFromJson<T extends Model>(
        Map<String, dynamic> json) =>
    ListResponse<T>(
      data: (json['data'] as List<dynamic>)
          .map(
              (e) => ResponseConverter<T>().fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ListResponseToJson<T extends Model>(
        ListResponse<T> instance) =>
    <String, dynamic>{
      'data': instance.data.map(ResponseConverter<T>().toJson).toList(),
      'meta': instance.meta?.toJson(),
    };
