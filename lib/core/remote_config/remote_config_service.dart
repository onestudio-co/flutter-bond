import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:bond/core/app_extensions.dart';
import 'package:bond/routes/app_router.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:one_studio_core/core.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'models/current_version.dart';

class RemoteConfigService {
  FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  String get buildNumber => sl<PackageInfo>().buildNumber;

  void initRemoteConfig() async {
    await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(minutes: 5),
    ));

    final defaults = <String, dynamic>{
      'appCurrentVersion':
          '{"ios":{"min_version":0,"max_version":0,"message":"حماية خصوصيتك تهمنا وأن تحصل على أفضل تجربة استخدام من أولوياتنا، يرجى تحديث نسختك الحالية"},"android":{"min_version":0,"max_version":0,"message":"حماية خصوصيتك تهمنا وأن تحصل على أفضل تجربة استخدام من أولوياتنا، يرجى تحديث نسختك الحالية"}}'
    };

    await FirebaseRemoteConfig.instance.setDefaults(defaults);

    try {
      debugPrint('Config :: start');
      await FirebaseRemoteConfig.instance.tryFetchAndActivate();

      await FirebaseRemoteConfig.instance.fetch();
      debugPrint('Config :: start 2');

      await FirebaseRemoteConfig.instance.activate();
      final String jsonString =
          FirebaseRemoteConfig.instance.getString('appCurrentVersion');
      debugPrint('Config :: $jsonString');
      CurrentVersion? remoteConfigVersion =
          CurrentVersion.fromJson(json.decode(jsonString));
      debugPrint('Config ::  Current st ${remoteConfigVersion.toString()}}');

      final int? currentVersion = int.tryParse(buildNumber);
      debugPrint('Config ::  Current $currentVersion');
      if (remoteConfigVersion.isForceUpdate) {
        sl<AppRouter>()
            .off(UpdateAppRoute(message: remoteConfigVersion.message));
      }
    } catch (e) {
      debugPrint('error $e');
    }
  }

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

  RemoteConfigService() {
    initRemoteConfig();
  }
}

extension ExtFirebaseRemoteConfig on FirebaseRemoteConfig {
  Future<bool> tryFetchAndActivate() async {
    try {
      return await fetchAndActivate();
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
