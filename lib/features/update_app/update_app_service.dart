import 'dart:convert';

import 'package:bond/core/app_extensions.dart';
import 'package:bond/routes/app_router.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:one_studio_core/core.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'models/current_version.dart';
import 'models/platform_version.dart';

class UpdateAppService {
  UpdateAppService({required this.remoteConfig, required this.packageInfo});

  final FirebaseRemoteConfig remoteConfig;
  final PackageInfo packageInfo;

  void call() async {
    try {
      await remoteConfig.fetchAndActivate();
      final jsonString = remoteConfig.getString('appCurrentVersion');
      final remoteConfigVersion =
          CurrentVersion.fromJson(json.decode(jsonString));
      final currentVersion = int.tryParse(packageInfo.buildNumber) ?? 0;
      final mustForceUpdate = checkForceUpdate(
        currentVersion,
        remoteConfigVersion.platformVersion,
      );
      if (mustForceUpdate) {
        showForceUpdate(remoteConfigVersion);
      }
    } catch (e) {
      debugPrint('error initRemoteConfig $e');
    }
  }

  void showForceUpdate(CurrentVersion remoteConfigVersion) {
    sl<AppRouter>().off(UpdateAppRoute(message: remoteConfigVersion.message));
  }

  void showSoftUpdate() {
    final String jsonString =
    FirebaseRemoteConfig.instance.getString('appCurrentVersion');
    CurrentVersion? remoteConfigVersion =
    CurrentVersion.fromJson(json.decode(jsonString));
    final currentVersion = int.tryParse(packageInfo.buildNumber) ?? 0;
    final isSoftUpdateApp = checkSoftUpdate(
      currentVersion,
      remoteConfigVersion.platformVersion,
    );
    if(isSoftUpdateApp) {
      sl<AppRouter>().push(SoftUpdateRoute(message: remoteConfigVersion.message));
    }
  }

  bool checkForceUpdate(int currentVersion, PlatformVersion platformVersion) =>
      currentVersion < platformVersion.minVersion;

  bool checkSoftUpdate(int currentVersion, PlatformVersion platformVersion) =>
      currentVersion < platformVersion.maxVersion;
}
