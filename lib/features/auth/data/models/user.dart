import 'package:fixit/core/models/model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'country.dart';
import 'organization.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User extends Model {
  final String? name;

  final String? bio;

  final String mobile;

  final String email;

  final String? dob;

  @JsonKey(name: "started_at")
  final String? startedAt;

  @JsonKey(name: "martial_status")
  final String? martialStatus;

  final Country? country;
  final Organization? organization;

  final String? gender;

  @JsonKey(name: "created_at")
  final DateTime createdAt;

  @JsonKey(name: "is_verified", defaultValue: false)
  final bool? isVerified;

  @JsonKey(name: "is_active", defaultValue: false)
  final bool isActive;

  @JsonKey(name: "live_available", defaultValue: false)
  final bool liveAvailable;

  @JsonKey(name: "schedule_available", defaultValue: false)
  final bool scheduleAvailable;

  const User({
    required int id,
    required this.name,
    this.organization,
    this.bio,
    required this.mobile,
    required this.email,
    required this.martialStatus,
    required this.dob,
    required this.startedAt,
    required this.gender,
    required this.isVerified,
    this.country,
    required this.isActive,
    required this.createdAt,
    required this.liveAvailable,
    required this.scheduleAvailable,
  }) : super(id: id);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    required String gender,
    required String name,
    required String bio,
    required String avatar,
    required String city,
    required String dob,
    required String email,
    required String status,
    required String martialStatus,
    required String referralCode,
    required String nationalID,
  }) {
    return User(
      id: id,
      name: name,
      organization: organization,
      bio: bio,
      mobile: mobile,
      email: email,
      martialStatus: martialStatus,
      dob: dob,
      startedAt: startedAt,
      gender: gender,
      isVerified: isVerified,
      country: country,
      isActive: isActive,
      createdAt: createdAt,
      liveAvailable: liveAvailable,
      scheduleAvailable: scheduleAvailable,
    );
  }

  String get mobileWithoutCode => mobile.replaceAll('+966', '');
}
