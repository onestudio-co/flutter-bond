import 'dart:io';

import 'package:bond/core/remote_config/models/platform_version.dart';
import 'package:one_studio_core/core.dart';
import 'package:package_info_plus/package_info_plus.dart';

class CurrentVersion {
  const CurrentVersion({
    required this.ios,
    required this.android,
  });

  final PlatformVersion ios;

  final PlatformVersion android;

  factory CurrentVersion.fromJson(Map<String, dynamic> json) => CurrentVersion(
        ios: PlatformVersion.fromJson(json['ios'] as Map<String, dynamic>),
        android:
            PlatformVersion.fromJson(json['android'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'ios': ios.toJson(),
        'android': android.toJson(),
      };

  PlatformVersion get platformVersion {
    if (Platform.isAndroid) {
      return android;
    } else {
      return ios;
    }
  }

  bool get isSoftUpdate {
    final int? currentVersion = int.tryParse(sl<PackageInfo>().buildNumber);
    {
      if (Platform.isAndroid) {
        if (currentVersion! < android.maxVersion) {
          return true;
        } else {
          return false;
        }
      } else {
        if (currentVersion! < ios.maxVersion) {
          return true;
        } else {
          return false;
        }
      }
    }
  }

  String? get message {
    if (Platform.isAndroid) {
      return android.message;
    } else {
      return ios.message;
    }
  }
}
