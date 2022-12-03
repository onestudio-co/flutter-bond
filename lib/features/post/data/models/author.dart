part of 'post.dart';

@JsonSerializable()
class Author {
  final String uuid;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  final String username;
  final String name;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;
  final String avatar;
  @JsonKey(name: 'twitter_username')
  final String? twitterUsername;
  @JsonKey(name: 'instagram_username')
  final String? instagramUsername;
  final String? bio;
  @JsonKey(name: 'total_likes')
  final num totalLikes;
  @JsonKey(name: 'total_photos')
  final num totalPhotos;

  Author({
    required this.uuid,
    required this.updatedAt,
    required this.username,
    required this.name,
    required this.firstName,
    this.lastName,
    required this.avatar,
    this.twitterUsername,
    this.instagramUsername,
    this.bio,
    required this.totalLikes,
    required this.totalPhotos,
  });

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
