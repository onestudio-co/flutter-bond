import 'package:fixit/features/auth/data/models/user.dart';
import 'package:fixit/features/profile/data/models/profile_meta.dart';

class AppBloc {
  User? user;
  String? token;
  String? mobile;
  String? tokenWc;
  ProfileMeta? profile;

  String? fullMobile;

  clearAppData() {}
}
