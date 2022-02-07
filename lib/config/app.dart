import 'package:famcare/app_service_provider.dart';
import 'package:famcare/features/auth/auth_service_provider.dart';

import 'service_provider.dart';

final List<ServiceProvider> providers = [
  AppServiceProvider(),
  AuthServiceProvider(),
];
