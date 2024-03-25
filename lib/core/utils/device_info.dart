import 'dart:io';

import 'package:bond/features/app/data/app_local_data_source.dart';
import 'package:bond_core/bond_core.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:universal_platform/universal_platform.dart';

class DeviceInfo {
  Future<Map<String, String>> toJson() async {
    final deviceInfoPlugin = sl<DeviceInfoPlugin>();
    final packageInfo = sl<PackageInfo>();
    final appLocalDataSource = sl<AppLocalDataSource>();
    final map = <String, String>{};
    map.addAll({
      'device_type': 'mobile',
      'device_model': '',
      'device_brand': getDeviceType(),
      'os_version': packageInfo.buildNumber,
      'app_version': packageInfo.buildNumber,
      'language': appLocalDataSource.currentLocale.languageCode,
      'device_id': await deviceIdInfo(),
    });
    if (UniversalPlatform.isAndroid) {
      final build = await deviceInfoPlugin.androidInfo;
      map.addAll(readAndroidBuildData(build));
    } else if (UniversalPlatform.isIOS) {
      final build = await deviceInfoPlugin.iosInfo;
      map.addAll(readIosDeviceInfo(build));
    }
    return map;
  }

  static Map<String, String> readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, String>{
      'os_version': build.version.release,
      'device_model': build.model,
    };
  }

  static Map<String, String> readIosDeviceInfo(IosDeviceInfo data) {
    return <String, String>{
      'os_version': data.systemVersion,
      'device_model': data.model,
    };
  }

  static Future<String> deviceIdInfo() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      return (await deviceInfo.androidInfo).id;
    }
    if (Platform.isIOS) {
      return (await deviceInfo.iosInfo).identifierForVendor ??
          'identifierForVendor is null';
    }
    return 'unknown';
  }

  static String getDeviceType() =>
      Platform.isAndroid ? 'android' : (Platform.isIOS ? 'ios' : 'unknown');
}
