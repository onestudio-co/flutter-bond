import 'package:json_annotation/json_annotation.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/auth/data/models/user.dart';
import 'package:taleb/features/city/data/models/city.dart';
import 'package:taleb/features/home/news/data/models/media.dart';
import 'package:taleb/features/home/offer/data/models/currency.dart';

part 'offer.g.dart';

@JsonSerializable(explicitToJson: true)
class Offer extends Model {
  @JsonKey(name: 'user_id')
  final int userId;
  final User user;
  @JsonKey(name: 'city_id')
  final int cityId;
  final City city;
  final String title;
  final String content;
  final String image;
  final double price;
  final Currency currency;
  @JsonKey(name: 'contact_number')
  final String contactNumber;
  @JsonKey(name: 'media')
  final List<Media> medias;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  const Offer({
    required int id,
    required this.userId,
    required this.user,
    required this.title,
    required this.content,
    required this.cityId,
    required this.city,
    required this.image,
    required this.price,
    required this.currency,
    required this.contactNumber,
    required this.medias,
    required this.createdAt,
    required this.updatedAt,
  }) : super(id: id);

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OfferToJson(this);
}
