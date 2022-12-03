part of 'post.dart';

@JsonSerializable()
class Urls {
  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;
  @JsonKey(name: 'small_s3')
  final String smallS3;

  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
    required this.smallS3,
  });

  factory Urls.fromJson(Map<String, dynamic> json) => _$UrlsFromJson(json);

  Map<String, dynamic> toJson() => _$UrlsToJson(this);
}
