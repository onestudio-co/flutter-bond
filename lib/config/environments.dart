import 'package:bond_core/core.dart';
import 'package:package_info_plus/package_info_plus.dart';

enum EnvironmentType { staging, production }

class Environments {
  static EnvironmentType get current =>
      sl<PackageInfo>().packageName.contains('staging')
          ? EnvironmentType.staging
          : EnvironmentType.production;
}
