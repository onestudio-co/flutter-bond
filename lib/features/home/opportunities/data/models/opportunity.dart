import 'package:json_annotation/json_annotation.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/auth/data/models/user.dart';
import 'package:taleb/features/city/data/models/city.dart';
import 'package:taleb/features/home/opportunities/data/models/opportunity_category.dart';
import 'package:taleb/main.dart';

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
  final String image;
  // @JsonKey(name: 'media')
  // final Map<String, Media> medias;
  @JsonKey(name: 'created_at')
  final String? createdAt;

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
    // required this.medias,
    required this.createdAt,
  }) : super(id: id);

  List<String> get mediaImages => [
        url,
        url,
        url,
      ];
  // medias.values.map((e) => e.originalUrl).toList();

  factory Opportunity.fromJson(Map<String, dynamic> json) =>
      _$OpportunityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OpportunityToJson(this);
}
