import 'package:fixit/core/models/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_meta.g.dart';

@JsonSerializable(explicitToJson: true)
class ProfileMeta extends Model {
  @JsonKey(name: "restored_user", defaultValue: false)
  final bool restoredUser;

  const ProfileMeta({required int id, required this.restoredUser})
      : super(id: id);

  factory ProfileMeta.fromJson(Map<String, dynamic> json) =>
      _$ProfileMetaFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProfileMetaToJson(this);

  @override
  List<Object> get props => [id, restoredUser];
}
