import 'package:famcare/features/auth/data/models/user.dart';
import 'package:famcare/features/profile/data/models/profile_meta.dart';

class AppBloc {
  User? user;
  String? token;
  String? mobile;
  String? tokenWc;
  ProfileMeta? profile;

  String? fullMobile;

  clearAppData() {}
}
