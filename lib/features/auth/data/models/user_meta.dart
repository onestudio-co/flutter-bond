import 'package:fixit/core/models/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_meta.g.dart';

@JsonSerializable(explicitToJson: true)
class UserMeta extends Model {
  final String token;

  @JsonKey(name: "wc_token")
  final String? wcToken;

  const UserMeta({required int id, required this.token, required this.wcToken})
      : super(id: id);

  factory UserMeta.fromJson(Map<String, dynamic> json) =>
      _$UserMetaFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserMetaToJson(this);
}
