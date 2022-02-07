import 'package:fixit/core/models/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable(explicitToJson: true)
class Country extends Model {
  final String name;
  final String code;

  const Country({required int id, required this.name, required this.code})
      : super(id: id);

  Country copyWith({
    required int id,
    required String name,
    required String code,
  }) =>
      Country(
        id: id,
        name: name,
        code: code,
      );

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
