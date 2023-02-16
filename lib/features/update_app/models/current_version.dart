import 'dart:io';

import 'package:bond/features/update_app/models/platform_version.dart';

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

  String get message {
    if (Platform.isAndroid) {
      return android.message;
    } else {
      return ios.message;
    }
  }
}
