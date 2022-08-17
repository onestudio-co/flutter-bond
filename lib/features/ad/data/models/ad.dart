import 'package:json_annotation/json_annotation.dart';
import 'package:one_studio_core/core.dart';

part 'ad.g.dart';

@JsonSerializable(explicitToJson: true)
class Ad extends Model {
  @JsonKey(
      defaultValue:
          'https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')
  final String image;

  const Ad({
    required int id,
    required this.image,
  }) : super(id: id);

  factory Ad.fromJson(Map<String, dynamic> json) => _$AdFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AdToJson(this);
}
