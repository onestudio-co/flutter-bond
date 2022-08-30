// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      medias: (json['media'] as List<dynamic>)
          .map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
      userId: json['user_id'] as int,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      title: json['title'] as String,
      content: json['content'] as String,
      cityId: json['city_id'] as int,
      city: City.fromJson(json['city'] as Map<String, dynamic>),
      image: json['image'] as String,
      id: json['id'] as int,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'user': instance.user.toJson(),
      'city_id': instance.cityId,
      'city': instance.city.toJson(),
      'title': instance.title,
      'content': instance.content,
      'image': instance.image,
      'media': instance.medias.map((e) => e.toJson()).toList(),
      'created_at': instance.createdAt,
    };
