import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

enum EnvironmentType { clientStaging, clientProduction }

class Environment {
  static Future<EnvironmentType> get current async {
    var packageToEnvironment = {
      "sa.example.famcare.staging": EnvironmentType.clientStaging,
      "sa.example.famcare": EnvironmentType.clientProduction,
    };

    if (Platform.isIOS || Platform.isAndroid) {
      var packageInfo = await PackageInfo.fromPlatform();
      debugPrint("packageInfo ${packageInfo.packageName}");
      return packageToEnvironment[packageInfo.packageName]!;
    } else {
      return packageToEnvironment["sa.app.famcare.staging"]!;
    }
  }

  static Future<String> get storeUrl async {
    return Platform.isAndroid
        ? 'https://play.google.com/store/apps/details?id=sa.app.famcare'
        : 'https://apps.apple.com/il/app/famcare/id1517781498';
  }
}
