// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileMeta _$ProfileMetaFromJson(Map<String, dynamic> json) => ProfileMeta(
      id: json['id'] as int,
      restoredUser: json['restored_user'] as bool? ?? false,
    );

Map<String, dynamic> _$ProfileMetaToJson(ProfileMeta instance) =>
    <String, dynamic>{
      'id': instance.id,
      'restored_user': instance.restoredUser,
    };
