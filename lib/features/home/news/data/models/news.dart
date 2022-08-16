import 'package:json_annotation/json_annotation.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/auth/data/models/user.dart';
import 'package:taleb/features/home/news/data/models/city.dart';

part 'news.g.dart';

@JsonSerializable(explicitToJson: true)
class News extends Model {
  @JsonKey(name: 'user_id')
  final int userId;
  final User user;
  @JsonKey(name: 'city_id')
  final int cityId;
  final City city;
  final String title;
  final String content;

  const News({
    required this.userId,
    required this.user,
    required this.title,
    required this.content,
    required this.cityId,
    required this.city,
    required int id,
  }) : super(id: id);

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
