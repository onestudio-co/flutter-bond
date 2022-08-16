import 'package:json_annotation/json_annotation.dart';
import 'package:one_studio_core/core.dart';

part 'city.g.dart';

@JsonSerializable(explicitToJson: true)
class City extends Model {
  final String name;

const City({
    required int id,
    required this.name,
  }) : super(id: id);

  factory City.fromJson(Map<String, dynamic> json) =>
      _$CityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CityToJson(this);
}
