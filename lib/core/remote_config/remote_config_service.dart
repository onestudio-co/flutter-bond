import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:bond/core/helepers/extensions/auto_route_extensions.dart';
import 'package:bond/routes/app_router.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:one_studio_core/core.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'models/current_version.dart';

class RemoteConfigService {
  FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
  CurrentVersion? remoteConfigVer;

  String get buildNumber => sl<PackageInfo>().buildNumber;

  void initRemoteConfig() async {
    await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(minutes: 5),
    ));

    final defaults = <String, dynamic>{
      'maintenance_mode': '0',
      'enableUXCam': '0',
      'maintenance_mode_message':
          'التطبيق قيد الصيانة حاليا حاول في  وقت لاحق ',
      'appCurrentVersion':
          '{"ios":{"min_version":0,"max_version":0,"message":"حماية خصوصيتك تهمنا وأن تحصل على أفضل تجربة استخدام من أولوياتنا، يرجى تحديث نسختك الحالية"},"android":{"min_version":0,"max_version":0,"message":"حماية خصوصيتك تهمنا وأن تحصل على أفضل تجربة استخدام من أولوياتنا، يرجى تحديث نسختك الحالية"}}'
    };

    await FirebaseRemoteConfig.instance.setDefaults(defaults);

    try {
      debugPrint('Config :: start');
      await FirebaseRemoteConfig.instance.tryfetchAndActivate();

      await FirebaseRemoteConfig.instance.fetch();
      debugPrint('Config :: start 2');

      await FirebaseRemoteConfig.instance.activate();
      var jsonStr =
          FirebaseRemoteConfig.instance.getString('appCurrentVersion');
      debugPrint('Config :: $jsonStr');
      remoteConfigVer = CurrentVersion.fromJson(json.decode(jsonStr));
      debugPrint('Config ::  Current st $remoteConfigVer}');

      var currentV = int.tryParse(buildNumber);
      debugPrint('Config ::  Current $currentV');
      if (remoteConfigVer!.isForceUpdate()) {
        sl<AppRouter>()
            .off(UpdateAppRoute(message: remoteConfigVer!.getMessage() ?? ''));
      }
    } catch (e) {
      debugPrint('error $e');
    }
  }

  var showSoftUpdate = true;

  void checkAndShowSoftUpdate(BuildContext context) {
    if (showSoftUpdate == false) {
      return;
    }
    showSoftUpdate = false;
    debugPrint('Config ::  remoteConfigVer $remoteConfigVer}+++remoteConfigVer!.isSoftUpdate()${remoteConfigVer!.isSoftUpdate()}');

    if (remoteConfigVer != null && remoteConfigVer!.isSoftUpdate()) {
      debugPrint('Config ::  Curr Mahmoud}');
      context.router
          .push(SoftUpdateRoute(message: remoteConfigVer?.getMessage() ?? ''));
    }
  }
}

extension ExtFirebaseRemoteConfig on FirebaseRemoteConfig {
  Future<bool> tryfetchAndActivate() async {
    try {
      return await fetchAndActivate();
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
