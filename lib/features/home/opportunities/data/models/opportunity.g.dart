// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Opportunity _$OpportunityFromJson(Map<String, dynamic> json) => Opportunity(
      userId: json['user_id'] as int,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      title: json['title'] as String,
      content: json['content'] as String,
      cityId: json['city_id'] as int,
      city: City.fromJson(json['city'] as Map<String, dynamic>),
      image: json['image'] as String? ??
          'https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      id: json['id'] as int,
    );

Map<String, dynamic> _$OpportunityToJson(Opportunity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'user': instance.user.toJson(),
      'city_id': instance.cityId,
      'city': instance.city.toJson(),
      'title': instance.title,
      'content': instance.content,
      'image': instance.image,
    };
