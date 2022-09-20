import 'package:json_annotation/json_annotation.dart';
import 'package:one_studio_core/core.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User extends Model implements Authenticable {
  @override
  final String name;
  @override
  final String email;
  @override
  final String phone;

  const User({
    required int id,
    required this.name,
    required this.email,
    required this.phone,
  }) : super(id: id);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  DateTime? get verificationAt => null;
}
