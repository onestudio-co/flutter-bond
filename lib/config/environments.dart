import 'package:one_studio_core/core.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../app/environments/env.dart';
import '../app/environments/env_staging.dart';

enum EnvironmentType { staging, production }

class Environments {
  static EnvironmentType get current =>
      sl<PackageInfo>().packageName.contains('staging')
          ? EnvironmentType.staging
          : EnvironmentType.production;
}

dynamic env(
  String key, {
  dynamic defaultValue,
}) {
  switch (Environments.current) {
    case EnvironmentType.staging:
      return EnvStaging.get(key);
    case EnvironmentType.production:
      return Env.get(key);
    default:
      return defaultValue ?? Env.get(key);
  }
}
