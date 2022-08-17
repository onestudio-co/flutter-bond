import 'package:json_annotation/json_annotation.dart';
import 'package:one_studio_core/core.dart';

part 'ad.g.dart';

@JsonSerializable(explicitToJson: true)
class Ad extends Model {
  @JsonKey(
      defaultValue:
          'https://cdn.searchenginejournal.com/wp-content/uploads/2020/01/responsive-display-ads-5e260c98e00db-1520x800.jpg')
  final String image;

  const Ad({
    required int id,
    required this.image,
  }) : super(id: id);

  factory Ad.fromJson(Map<String, dynamic> json) => _$AdFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AdToJson(this);
}
