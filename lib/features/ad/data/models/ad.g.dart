// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ad _$AdFromJson(Map<String, dynamic> json) => Ad(
      id: json['id'] as int,
      image: json['image'] as String? ??
          'https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    );

Map<String, dynamic> _$AdToJson(Ad instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
    };
