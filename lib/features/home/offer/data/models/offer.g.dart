// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Offer _$OfferFromJson(Map<String, dynamic> json) => Offer(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      title: json['title'] as String,
      content: json['content'] as String,
      cityId: json['city_id'] as int,
      city: City.fromJson(json['city'] as Map<String, dynamic>),
      image: json['image'] as String,
      price: (json['price'] as num).toDouble(),
      currency: Currency.fromJson(json['currency'] as Map<String, dynamic>),
      contactNumber: json['contact_number'] as String,
      medias: (json['media'] as List<dynamic>)
          .map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$OfferToJson(Offer instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'user': instance.user.toJson(),
      'city_id': instance.cityId,
      'city': instance.city.toJson(),
      'title': instance.title,
      'content': instance.content,
      'image': instance.image,
      'price': instance.price,
      'currency': instance.currency.toJson(),
      'contact_number': instance.contactNumber,
      'media': instance.medias.map((e) => e.toJson()).toList(),
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
