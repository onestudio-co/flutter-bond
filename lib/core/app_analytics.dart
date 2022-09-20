import 'dart:developer';

import 'package:bond/config/app.dart';
import 'package:one_studio_core/core.dart';

class AppAnalytics {
  static void fire(AnalyticsEvent event) {
    for (final provider in analyticsProviders) {
      log('AppAnalytics provider ${provider.runtimeType}'
          ' fire log ${event.key} and params ${event.params}');
      provider.log(event);
    }
  }
}
