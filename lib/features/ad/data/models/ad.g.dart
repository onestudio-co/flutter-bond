// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ad _$AdFromJson(Map<String, dynamic> json) => Ad(
      id: json['id'] as int,
      image: json['image'] as String? ??
          'https://cdn.searchenginejournal.com/wp-content/uploads/2020/01/responsive-display-ads-5e260c98e00db-1520x800.jpg',
    );

Map<String, dynamic> _$AdToJson(Ad instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
    };
