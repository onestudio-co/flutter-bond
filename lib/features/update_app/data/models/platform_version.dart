import 'package:json_annotation/json_annotation.dart';

part 'platform_version.g.dart';

@JsonSerializable()
class PlatformVersion {
  const PlatformVersion({
    required this.minVersion,
    required this.maxVersion,
    required this.message,
  });
  @JsonKey(name: 'min_version')
  final int minVersion;
  @JsonKey(name: 'max_version')
  final int maxVersion;
  final String message;

  factory PlatformVersion.fromJson(Map<String, dynamic> json) =>
      _$PlatformVersionFromJson(json);

  Map<String, dynamic> toJson() => _$PlatformVersionToJson(this);
}
