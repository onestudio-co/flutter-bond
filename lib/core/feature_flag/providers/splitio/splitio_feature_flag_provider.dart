import 'dart:async';

import 'package:bond/core/feature_flag/feature_flag_status.dart';
import 'package:bond/core/feature_flag/providers/feature_flag_provider.dart';
import 'package:bond/core/feature_flag/providers/splitio/splitio_service.dart';

class SplitIOFeatureFlagService<T> extends FeatureFlagService<T> {
  final splitClient = SplitIOService.instance.client;
  StreamSubscription? splitioUpdateStream;

  @override
  Map<String, dynamic> get attributes => throw UnimplementedError();

  @override
  Future<T> getFeatureFlagValue(
    String key, {
    required FeatureFlagStatus defaultStatus,
  }) async {
    final String? treatment = await splitClient?.getTreatment(
      key,
      attributes,
    );
    if (T == bool) {
      bool showFeature = treatment == 'on';
      return showFeature as T;
    } else {
      flagValue.add(treatment as T);
      return treatment as T;
    }
  }

  @override
  Future<void> registerFlagListener(String key) async {
    final String? treatment = await splitClient?.getTreatment(
      key,
      attributes,
    );
    if (T == bool) {
      bool showFeature = treatment == 'on';
      flagValue.add(showFeature as T);
    } else {
      flagValue.add(treatment as T);
    }
  }

  @override
  Future<void>? unregisterFlagListener(String key) {
    return splitioUpdateStream?.cancel();
  }
}
