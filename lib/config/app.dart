import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:one_studio_core/core.dart';

import '../features/auth/auth_service_provider.dart';
import '../providers/api_service_provider.dart';
import '../providers/app_service_provider.dart';
import '../providers/config_service_provider.dart';

/// The list of providers that will be used by the app.
final List<ServiceProvider> providers = [
  // Framework Service Providers
  ConfigServiceProvider(),
  ApiServiceProvider(),

  // Modules Service Providers
  AppServiceProvider(),
  AuthServiceProvider(),
];

/// The list of providers that should be used to log analytics events.
final List<AnalyticsProvider> analyticsProviders = [
  FirebaseAnalyticsProvider(FirebaseAnalytics.instance),
];
