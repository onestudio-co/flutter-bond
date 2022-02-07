import 'package:fixit/app_service_provider.dart';
import 'package:fixit/features/auth/auth_service_provider.dart';

import 'service_provider.dart';

final List<ServiceProvider> providers = [
  AppServiceProvider(),
  AuthServiceProvider(),
];
