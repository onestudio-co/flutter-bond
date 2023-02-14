import 'dart:io';

import 'package:bond/core/remote_config/models/platform_version.dart';
import 'package:one_studio_core/core.dart';
import 'package:package_info_plus/package_info_plus.dart';

class CurrentVersion {
  const CurrentVersion({
    this.ios,
    this.android,
  });
  final PlatformVersion? ios;

  final PlatformVersion? android;

  factory CurrentVersion.fromJson(Map<String, dynamic> json) => CurrentVersion(
        ios: json['ios'] == null
            ? null
            : PlatformVersion.fromJson(json['ios'] as Map<String, dynamic>),
        android: json['android'] == null
            ? null
            : PlatformVersion.fromJson(json['android'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'ios': ios?.toJson(),
        'android': android?.toJson(),
      };

  bool isSoftUpdate() {
    var currentV = int.tryParse(sl<PackageInfo>().buildNumber);
    {
      if (Platform.isAndroid) {
        if (currentV! < android!.maxVersion!) {
          return true;
        } else {
          return false;
        }
      } else {
        if (currentV! < ios!.maxVersion!) {
          return true;
        } else {
          return false;
        }
      }
    }
  }

  bool isForceUpdate() {
    var currentV = int.tryParse(sl<PackageInfo>().buildNumber);

    if (Platform.isAndroid) {
      if (currentV! < android!.minVersion!) {
        return true;
      } else {
        return false;
      }
    } else {
      if (currentV! < ios!.minVersion!) {
        return true;
      } else {
        return false;
      }
    }
  }

  String? getMessage() {
    if (Platform.isAndroid) {
      return android!.message;
    } else {
      return ios!.message;
    }
  }
}
