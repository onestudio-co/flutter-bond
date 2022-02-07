import 'package:fixit/core/models/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'organization.g.dart';

@JsonSerializable(explicitToJson: true)
class Organization extends Model {
  final String name;
  final String logo;

  const Organization({
    required int id,
    required this.name,
    required this.logo,
  }) : super(id: id);

  Organization copyWith({
    required int id,
    required String name,
    required String logo,
  }) =>
      Organization(
        id: id,
        name: name,
        logo: logo,
      );

  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OrganizationToJson(this);
}
