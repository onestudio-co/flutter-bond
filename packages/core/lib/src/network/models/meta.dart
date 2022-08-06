import 'package:json_annotation/json_annotation.dart';

part 'meta.g.dart';

@JsonSerializable(explicitToJson: true)
class Meta {
  final int? from;
  @JsonKey(name: "last_page")
  final int lastPage;
  final String path;
  @JsonKey(name: "per_page")
  final int perPage;
  final int? to;

  const Meta({
    required this.from,
    required this.lastPage,
    required this.path,
    required this.perPage,
    required this.to,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
