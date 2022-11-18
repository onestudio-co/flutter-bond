library app_analytics;

import 'dart:developer';

import 'package:one_studio_core/core.dart';

import '../config/analytics.dart';

export 'app_analytics_providers/firebase_analytics_provider.dart';

class AppAnalytics {
  static void fire(AnalyticsEvent event) {
    AnalyticsConfig.providers.forEach(
      (key, value) {
        final driver = value['driver'] as String;
        log('AppAnalytics provider $driver'
            ' fire log ${event.key} and params ${event.params}');
        sl<AnalyticsProvider>(instanceName: driver).log(event);
      },
    );
  }
}
