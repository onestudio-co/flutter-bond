import 'package:bond/providers/notifications_service_provider.dart';
import 'package:one_studio_core/core.dart';

import '../features/auth/auth_service_provider.dart';
import '../providers/analytics_service_provider.dart';
import '../providers/api_service_provider.dart';
import '../providers/app_service_provider.dart';
import '../providers/config_service_provider.dart';

/// The list of app_analytics_providers that will be used by the app.
final List<ServiceProvider> providers = [
  // Framework Service Providers
  ConfigServiceProvider(),
  ApiServiceProvider(),
  AnalyticsServiceProvider(),
  NotificationsServiceProvider(),

  // Modules Service Providers
  AppServiceProvider(),
  AuthServiceProvider(),
];
