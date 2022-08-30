import 'package:json_annotation/json_annotation.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/auth/data/models/user.dart';
import 'package:taleb/features/city/data/models/city.dart';
import 'package:taleb/features/home/news/data/models/media.dart';

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
  final String image;
  @JsonKey(name: 'media')
  final Map<String, Media> medias;
  @JsonKey(name: 'created_at')
  final String createdAt;

  const News({
    required this.medias,
    required this.userId,
    required this.user,
    required this.title,
    required this.content,
    required this.cityId,
    required this.city,
    required this.image,
    required int id,
    required this.createdAt,
  }) : super(id: id);

  List<String> get mediaImages =>
      medias.values.map((e) => e.originalUrl).toList();

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
