import 'dart:async';

import 'package:bond/features/auth/auth.dart';
import 'package:flutter/foundation.dart';
import 'package:one_studio_core/core.dart';
import 'package:splitio/splitio.dart';

class SplitIOService {
  static SplitIOService instance = SplitIOService();
  Splitio? splitio;
  SplitClient? _client;

  var splitioUpdateStream = StreamController<bool>.broadcast();

  SplitClient? get client => _client;

  Future<void> init(Map<String, dynamic>? configs) async {
    User? loggedUser = Auth.user();

    String matchingKey;
    if (loggedUser != null) {
      matchingKey = 'User:${loggedUser.id}';
    } else {
      final String deviceId = await deviceIdInfo();
      matchingKey = 'Device:$deviceId';
    }

    final SplitConfiguration configurationOptions = SplitConfiguration(
      trafficType: 'user',
      enableDebug: kDebugMode,
      persistentAttributesEnabled: false,
      streamingEnabled: true,
      featuresRefreshRate: 30,
    );

    splitio = Splitio(
      configs?['mobile_key'],
      matchingKey,
      configuration: configurationOptions,
    );

    _client = splitio?.client(matchingKey: matchingKey);
  }
}
