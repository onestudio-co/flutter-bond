import 'package:taleb/features/auth/data/models/user.dart';
import 'package:taleb/features/profile/data/models/profile_meta.dart';

class App {
  User? user;
  String? token;
  String? mobile;
  String? tokenWc;
  ProfileMeta? profile;

  String? fullMobile;

  void clearAppData() {}
}
