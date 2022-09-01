// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ad _$AdFromJson(Map<String, dynamic> json) => Ad(
      id: json['id'] as int,
      image: json['image'] as String,
      url: json['url'] as String,
      isPaid: json['is_paid'] as bool,
    );

Map<String, dynamic> _$AdToJson(Ad instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'url': instance.url,
      'is_paid': instance.isPaid,
    };
