import 'package:json_annotation/json_annotation.dart';
import 'package:one_studio_core/core.dart';

part 'user_meta.g.dart';

@JsonSerializable(explicitToJson: true)
class UserMeta with Jsonable {
  final String token;

  const UserMeta({
    required this.token,
  });

  factory UserMeta.fromJson(Map<String, dynamic> json) =>
      _$UserMetaFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserMetaToJson(this);
}
