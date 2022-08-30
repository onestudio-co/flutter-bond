// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Opportunity _$OpportunityFromJson(Map<String, dynamic> json) => Opportunity(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      title: json['title'] as String,
      content: json['content'] as String,
      cityId: json['city_id'] as int,
      city: City.fromJson(json['city'] as Map<String, dynamic>),
      image: json['image'] as String,
      opportunityCategotyId: json['opportunity_category_id'] as int,
      opportunityCategory: OpportunityCategory.fromJson(
          json['opportunity_category'] as Map<String, dynamic>),
      medias: (json['media'] as List<dynamic>)
          .map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$OpportunityToJson(Opportunity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'opportunity_category_id': instance.opportunityCategotyId,
      'opportunity_category': instance.opportunityCategory.toJson(),
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
