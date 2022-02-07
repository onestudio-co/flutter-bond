// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      name: json['name'] as String?,
      organization: json['organization'] == null
          ? null
          : Organization.fromJson(json['organization'] as Map<String, dynamic>),
      bio: json['bio'] as String?,
      mobile: json['mobile'] as String,
      email: json['email'] as String,
      martialStatus: json['martial_status'] as String?,
      dob: json['dob'] as String?,
      startedAt: json['started_at'] as String?,
      gender: json['gender'] as String?,
      isVerified: json['is_verified'] as bool? ?? false,
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
      isActive: json['is_active'] as bool? ?? false,
      createdAt: DateTime.parse(json['created_at'] as String),
      liveAvailable: json['live_available'] as bool? ?? false,
      scheduleAvailable: json['schedule_available'] as bool? ?? false,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'bio': instance.bio,
      'mobile': instance.mobile,
      'email': instance.email,
      'dob': instance.dob,
      'started_at': instance.startedAt,
      'martial_status': instance.martialStatus,
      'country': instance.country?.toJson(),
      'organization': instance.organization?.toJson(),
      'gender': instance.gender,
      'created_at': instance.createdAt.toIso8601String(),
      'is_verified': instance.isVerified,
      'is_active': instance.isActive,
      'live_available': instance.liveAvailable,
      'schedule_available': instance.scheduleAvailable,
    };
