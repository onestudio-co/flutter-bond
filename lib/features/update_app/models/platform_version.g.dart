// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlatformVersion _$PlatformVersionFromJson(Map<String, dynamic> json) =>
    PlatformVersion(
      minVersion: json['minVersion'] as int,
      maxVersion: json['maxVersion'] as int,
      message: json['message'] as String,
    );

Map<String, dynamic> _$PlatformVersionToJson(PlatformVersion instance) =>
    <String, dynamic>{
      'minVersion': instance.minVersion,
      'maxVersion': instance.maxVersion,
      'message': instance.message,
    };
