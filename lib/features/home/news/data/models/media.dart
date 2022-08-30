import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:one_studio_core/core.dart';

part 'media.g.dart';

@JsonSerializable()
class Media extends Equatable with Jsonable {
  final String? name;
  @JsonKey(name: 'file_name')
  final String? fileName;
  final String? uuid;
  @JsonKey(name: 'preview_url')
  final String? previewUrl;
  @JsonKey(name: 'original_url')
  final String originalUrl;
  final int? order;
  @JsonKey(name: 'custom_properties')
  final String? customProperties;
  final String? extension;
  final int? size;

  Media({
    required this.originalUrl,
    this.name,
    this.fileName,
    this.uuid,
    this.previewUrl,
    this.order,
    this.customProperties,
    this.extension,
    this.size,
  });

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MediaToJson(this);

  @override
  List<Object?> get props => [
        name,
        fileName,
        uuid,
        previewUrl,
        originalUrl,
        order,
        customProperties,
        extension,
        size
      ];
}
