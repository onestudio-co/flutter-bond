// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      userId: json['user_id'] == null ? 0 : json['user_id'] as int,
      user: json['user'] == null
          ? User(id: 1, name: '', image: url)
          : User.fromJson(json['user'] as Map<String, dynamic>),
      title: json['title'] as String,
      content: json['content'] as String,
      cityId: json['city_id'] == null ? 0 : json['city_id'] as int,
      city: json['city'] == null
          ? City(id: 1, name: 'gg')
          : City.fromJson(json['city'] as Map<String, dynamic>),
      image: json['image'] as String? ??
          'https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      id: json['id'] as int,
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
    };
