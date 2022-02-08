import 'package:fixit/providers/api_service_provider.dart';
import 'package:fixit/providers/app_service_provider.dart';
import 'package:fixit/features/auth/auth_service_provider.dart';
import 'package:fixit/providers/config_service_provider.dart';

import '../core/service_provider.dart';

final List<ServiceProvider> providers = [
  // Framework Service Providers
  ConfigServiceProvider(),
  ApiServiceProvider(),

  // Modules Service Providers
  AppServiceProvider(),
  AuthServiceProvider(),
];
