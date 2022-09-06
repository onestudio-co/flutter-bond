import 'package:one_studio_core/core.dart';

class UserDto {
  final String mobile;
  final String password;

  UserDto({required this.mobile, required this.password});

  Future<Map<String, dynamic>> get body async {
    return {
      "mobile": "+966${mobile.cleanMobile}",
      "password": password,
      "device_id": await deviceIdInfo(),
      "device_type": getDeviceType(),
    };
  }
}
