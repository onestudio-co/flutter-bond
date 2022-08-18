import 'package:json_annotation/json_annotation.dart';
import 'package:one_studio_core/core.dart';

part 'opportunity_category.g.dart';

@JsonSerializable()
class OpportunityCategory extends Model {
  final String name;

  const OpportunityCategory({
    required int id,
    required this.name,
  }) : super(id: id);

  factory OpportunityCategory.fromJson(Map<String, dynamic> json) =>
      _$OpportunityCategoryFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OpportunityCategoryToJson(this);
}
