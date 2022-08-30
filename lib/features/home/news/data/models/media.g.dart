// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Media _$MediaFromJson(Map<String, dynamic> json) => Media(
      originalUrl: json['original_url'] as String,
      name: json['name'] as String?,
      fileName: json['file_name'] as String?,
      uuid: json['uuid'] as String?,
      previewUrl: json['preview_url'] as String?,
      order: json['order'] as int?,
      customProperties: json['custom_properties'] as List<dynamic>?,
      extension: json['extension'] as String?,
      size: json['size'] as int?,
    );

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'name': instance.name,
      'file_name': instance.fileName,
      'uuid': instance.uuid,
      'preview_url': instance.previewUrl,
      'original_url': instance.originalUrl,
      'order': instance.order,
      'custom_properties': instance.customProperties,
      'extension': instance.extension,
      'size': instance.size,
    };
