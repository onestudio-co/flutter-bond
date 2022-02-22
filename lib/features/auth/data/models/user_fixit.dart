import 'package:fixit/core/auth/authenticable.dart';
import 'package:fixit/core/models/model.dart';

class UserFixit extends Model implements Authenticable {
  final String userName;
  final String email;
  final String mobile;
  const UserFixit({
    required int id,
    required this.userName,
    required this.email,
    required this.mobile,
  }) : super(id: id);

  factory UserFixit.fromMap(Map<String, dynamic> map) {
    return UserFixit(
      id: map['id'] ?? 1,
      userName: map['username'] ?? '',
      email: map['email'] ?? '',
      mobile: map['mobile'] ?? '',
    );
  }
}
