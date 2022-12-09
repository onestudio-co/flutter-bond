import 'dart:async';

import 'package:bond/core/feature_flag/feature_flag_status.dart';

abstract class FeatureFlagService<T> {
  final StreamController<T> flagValue = StreamController<T>.broadcast();

  Map<String, dynamic> get attributes;

  Future<T> getFeatureFlagValue(
    String key, {
    required FeatureFlagStatus defaultStatus,
  });

  Future<void> registerFlagListener(String key);

  Future<void>? unregisterFlagListener(String key);
}
