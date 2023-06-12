import 'package:json_annotation/json_annotation.dart';
import 'package:bond_core/core.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User extends Model with Authenticable {
  @override
  final String? name;
  @override
  final String? email;

  const User({
    required int id,
    this.name,
    this.email,
  }) : super(id: id);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [name, id, phone, email];

  @override
  String? get phone => null;

  @override
  DateTime? get verificationAt => null;
}
