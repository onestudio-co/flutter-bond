import 'package:bond/core/app_analytics.dart';

class AnalyticsConfig {
  static var providers = {
    'firebase_analytics_provider': {
      'driver': 'firebase_analytics_provider',
      'class': FirebaseAnalyticsProvider,
    },

  };
}
