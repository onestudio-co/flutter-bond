import '../models/country.dart';
import '../models/user.dart';
import '../models/user_meta.dart';

class AuthResponseConverter {
  static T? convert<T>(Map<String, dynamic> json) {
    if (T == User) {
      return User.fromJson(json) as T;
    } else if (T == UserMeta) {
      return UserMeta.fromJson(json) as T;
    } else if (T == Country) {
      return Country.fromJson(json) as T;
    }
    return null;
  }
}
