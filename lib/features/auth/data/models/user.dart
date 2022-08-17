import 'package:json_annotation/json_annotation.dart';
import 'package:one_studio_core/core.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User extends Model implements Authenticable {
  @override
  final String name;
  @JsonKey(
      defaultValue:
          'https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')
  final String image;

  const User({
    required int id,
    required this.name,
    required this.image,
  }) : super(id: id);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    String? name,
    String? image,
  }) {
    return User(
      id: id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  @override
  // TODO: implement email
  String? get email => throw UnimplementedError();

  @override
  // TODO: implement phone
  String? get phone => throw UnimplementedError();
}
