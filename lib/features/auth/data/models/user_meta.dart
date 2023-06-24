import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:bond_core/bond_core.dart';

part 'user_meta.g.dart';
@JsonSerializable(explicitToJson: true)
class UserMeta extends Equatable with Jsonable {
  final String token;

  const UserMeta({required this.token});

  factory UserMeta.fromJson(Map<String, dynamic> json) =>
      _$UserMetaFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserMetaToJson(this);

  @override
  List<Object?> get props => [token];

}