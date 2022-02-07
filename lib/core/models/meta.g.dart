// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      id: json['id'] as int,
      from: json['from'] as int,
      lastPage: json['lastPage'] as int,
      path: json['path'] as String,
      perPage: json['perPage'] as int,
      to: json['to'] as int,
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'id': instance.id,
      'from': instance.from,
      'lastPage': instance.lastPage,
      'path': instance.path,
      'perPage': instance.perPage,
      'to': instance.to,
    };
