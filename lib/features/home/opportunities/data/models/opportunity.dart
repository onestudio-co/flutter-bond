import 'package:json_annotation/json_annotation.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/auth/data/models/user.dart';
import 'package:taleb/features/city/data/models/city.dart';
import 'package:taleb/features/home/opportunities/data/models/opportunity_category.dart';

part 'opportunity.g.dart';

@JsonSerializable(explicitToJson: true)
class Opportunity extends Model {
  @JsonKey(name: 'opportunity_category_id')
  final int opportunityCategotyId;
  @JsonKey(name: 'opportunity_category')
  final OpportunityCategory opportunityCategory;
  @JsonKey(name: 'user_id')
  final int userId;
  final User user;
  @JsonKey(name: 'city_id')
  final int cityId;
  final City city;
  final String title;
  final String content;
  @JsonKey(
      defaultValue:
          'https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')
  final String image;
  @JsonKey(name: 'created_at')
  final String createdAt;

  const Opportunity({
    required int id,
    required this.userId,
    required this.user,
    required this.title,
    required this.content,
    required this.cityId,
    required this.city,
    required this.image,
    required this.opportunityCategotyId,
    required this.opportunityCategory,
    required this.createdAt,
  }) : super(id: id);

  factory Opportunity.fromJson(Map<String, dynamic> json) =>
      _$OpportunityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OpportunityToJson(this);
}
