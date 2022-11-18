import 'package:bond/core/app_analytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get_it/get_it.dart';
import 'package:one_studio_core/core.dart';

import '../config/analytics.dart';

class AnalyticsServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    AnalyticsConfig.providers.forEach(
      (key, value) {
        if (value['driver'] == 'firebase_analytics_provider') {
          it.registerFactory<AnalyticsProvider>(
            () => FirebaseAnalyticsProvider(FirebaseAnalytics.instance),
            instanceName: 'firebase_analytics_provider',
          );
        }
      },
    );
  }
}
