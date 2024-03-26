import 'package:bond/providers/notifications_service_provider.dart';
import 'package:bond_core/bond_core.dart';

import '../features/auth/auth_service_provider.dart';
import '../features/post/post_service_provider.dart';
import '../providers/analytics_service_provider.dart';
import '../providers/api_service_provider.dart';
import '../providers/app_service_provider.dart';
import '../providers/cache_service_provider.dart';
import '../providers/firebase_service_provider.dart';

final List<ServiceProvider> providers = [
  // Framework Service Providers
  FirebaseServiceProvider(),
  AppServiceProvider(),
  CacheServiceProvider(),
  AuthServiceProvider(),
  ApiServiceProvider(),
  AnalyticsServiceProvider(),
  NotificationsServiceProvider(),

  // Modules Service Providers
  PostServiceProvider(),
];
