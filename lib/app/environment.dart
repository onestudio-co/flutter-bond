import 'package:package_info_plus/package_info_plus.dart';

enum EnvironmentType { staging, production }

class Environment {
  static Future<EnvironmentType> get current async {
    final packageInfo = await PackageInfo.fromPlatform();

    return packageInfo.packageName.contains('staging')
        ? EnvironmentType.staging
        : EnvironmentType.production;
  }
}
