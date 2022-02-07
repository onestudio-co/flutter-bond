// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMeta _$UserMetaFromJson(Map<String, dynamic> json) => UserMeta(
      id: json['id'] == null ? 0 : json['id'] as int,
      token: json['token'] as String,
      wcToken: json['wc_token'] == null ? null : json['wc_token'] as String,
    );

Map<String, dynamic> _$UserMetaToJson(UserMeta instance) => <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
      'wc_token': instance.wcToken,
    };
