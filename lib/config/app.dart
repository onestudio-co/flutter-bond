import 'package:bond/providers/api_service_provider.dart';
import 'package:bond/providers/app_service_provider.dart';
import 'package:bond/features/auth/auth_service_provider.dart';
import 'package:bond/providers/config_service_provider.dart';

import '../core/service_provider.dart';

final List<ServiceProvider> providers = [
  // Framework Service Providers
  ConfigServiceProvider(),
  ApiServiceProvider(),

  // Modules Service Providers
  AppServiceProvider(),
  AuthServiceProvider(),
];
