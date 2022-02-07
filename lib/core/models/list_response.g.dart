// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListResponse<T> _$ListResponseFromJson<T extends Equatable>(
        Map<String, dynamic> json) =>
    ListResponse<T>(
      data: (json['data'] as List<dynamic>)
          .map((e) => ResponseConverter<T>().fromJson(e as Object))
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ListResponseToJson<T extends Equatable>(
        ListResponse<T> instance) =>
    <String, dynamic>{
      'data': instance.data.map(ResponseConverter<T>().toJson).toList(),
      'meta': instance.meta.toJson(),
    };
