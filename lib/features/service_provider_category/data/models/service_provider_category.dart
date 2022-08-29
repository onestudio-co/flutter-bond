import 'package:json_annotation/json_annotation.dart';
import 'package:one_studio_core/core.dart';

part 'service_provider_category.g.dart';

@JsonSerializable()
class ServiceProviderCategory extends Model {
  final String name;

  const ServiceProviderCategory({
    required int id,
    required this.name,
  }) : super(id: id);

  factory ServiceProviderCategory.fromJson(Map<String, dynamic> json) =>
      _$ServiceProviderCategoryFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ServiceProviderCategoryToJson(this);
}
