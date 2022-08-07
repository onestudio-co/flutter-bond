import '../features/auth/auth_service_provider.dart';

import '../providers/api_service_provider.dart';
import '../providers/app_service_provider.dart';
import '../providers/config_service_provider.dart';

final providers = [
  // Framework Service Providers
  ConfigServiceProvider(),
  ApiServiceProvider(),

  // Modules Service Providers
  AppServiceProvider(),
  AuthServiceProvider(),
];
