import 'package:json_annotation/json_annotation.dart';

import 'model.dart';

part 'meta.g.dart';

@JsonSerializable(explicitToJson: true)
class Meta extends Model {
  final int from;
  final int lastPage;
  final String path;
  final int perPage;
  final int to;

  const Meta(
      {required int id,
      required this.from,
      required this.lastPage,
      required this.path,
      required this.perPage,
      required this.to})
      : super(id: id);

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
