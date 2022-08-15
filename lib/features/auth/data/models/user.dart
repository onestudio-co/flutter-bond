import 'package:one_studio_core/core.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User extends Model implements Authenticable {
  @override
  final String name;

  const User({
    required int id,
    required this.name,
  }) : super(id: id);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    String? name,
  }) {
    return User(
      id: id,
      name: name ?? this.name,
    );
  }
  
  @override
  // TODO: implement email
  String? get email => throw UnimplementedError();
  
  @override
  // TODO: implement phone
  String? get phone => throw UnimplementedError();
}
