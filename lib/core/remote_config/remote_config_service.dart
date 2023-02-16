import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:bond/core/app_extensions.dart';
import 'package:bond/routes/app_router.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:one_studio_core/core.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'models/current_version.dart';
import 'models/platform_version.dart';

// TODO: soft force update app service
// TODO: move it from core
// data -> models -> remote_config -> remote_config_service
// presntations ->  pages -> page -> widgets -> widget -> routes
class RemoteConfigService {
  RemoteConfigService({required this.remoteConfig, required this.packageInfo});

  final FirebaseRemoteConfig remoteConfig;
  final PackageInfo packageInfo;

  void call() async {

    try {
      await remoteConfig.fetchAndActivate();
      final jsonString = remoteConfig.getString('appCurrentVersion');
      debugPrint('Config :: $jsonString');
      final remoteConfigVersion =
          CurrentVersion.fromJson(json.decode(jsonString));
      debugPrint('Config ::  Current st ${remoteConfigVersion.toString()}}');
      final currentVersion = int.tryParse(packageInfo.buildNumber) ?? 0;
      final mustForceUpdate = isForceUpdate(
        currentVersion,
        remoteConfigVersion.platformVersion,
      );
      if (mustForceUpdate) {
        sl<AppRouter>()
            .off(UpdateAppRoute(message: remoteConfigVersion.message));
      }
    } catch (e) {
      debugPrint('error initRemoteConfig $e');
    }
  }

  bool isForceUpdate(int currentVersion, PlatformVersion platformVersion) =>
      currentVersion < platformVersion.minVersion;

  var showSoftUpdate = true;

  void checkAndShowSoftUpdate(BuildContext context) async {
    if (showSoftUpdate == false) {
      return;
    }
    showSoftUpdate = false;
    final String jsonString =
        FirebaseRemoteConfig.instance.getString('appCurrentVersion');
    debugPrint('Config :: $jsonString');
    CurrentVersion? remoteConfigVersion =
        CurrentVersion.fromJson(json.decode(jsonString));
    debugPrint(
        'Config ::  remoteConfigVer $remoteConfigVersion}+++remoteConfigVer!.isSoftUpdate()${remoteConfigVersion.isSoftUpdate}');

    if (remoteConfigVersion.isSoftUpdate) {
      debugPrint('Config ::  Curr Mahmoud}');
      context.router
          .push(SoftUpdateRoute(message: remoteConfigVersion.message));
    }
  }
}
