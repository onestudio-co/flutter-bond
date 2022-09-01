import 'package:json_annotation/json_annotation.dart';
import 'package:one_studio_core/core.dart';

part 'ad.g.dart';

@JsonSerializable(explicitToJson: true)
class Ad extends Model {
  final String image;
  final String url;
  @JsonKey(name: 'is_paid')
  final bool isPaid;

  const Ad({
    required int id,
    required this.image,
    required this.url,
    required this.isPaid,
  }) : super(id: id);

  factory Ad.fromJson(Map<String, dynamic> json) => _$AdFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AdToJson(this);
}
