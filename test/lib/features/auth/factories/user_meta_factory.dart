import 'package:fixit/features/auth/data/models/user_meta.dart';

class UserMetaFactory{

  static create({String? token, String? wcToken}) {
    return UserMeta(
      token: token ?? 'token',
      wcToken: wcToken ?? 'wcToken',
    );
  }
}