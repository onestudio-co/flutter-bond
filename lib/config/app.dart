import 'package:taleb/features/ad/ad_service_provider.dart';
import 'package:taleb/features/city/city_service_provider.dart';
import 'package:taleb/features/home/news/news_service_provider.dart';
import 'package:taleb/features/home/offer/offer_imports.dart';
import 'package:taleb/features/home/opportunities/opportuities_service_provider.dart';
import 'package:taleb/features/service_provider/service_provider_service_provider.dart';
import 'package:taleb/features/service_provider_category/service_provider_category_service_provider.dart';
import 'package:taleb/integrations/integration_service_provider.dart';

import '../features/auth/auth_service_provider.dart';
import '../providers/api_service_provider.dart';
import '../providers/app_service_provider.dart';
import '../providers/config_service_provider.dart';

// ignore: always_specify_types
final providers = [
  /// [Framework] Service Providers
  ConfigServiceProvider(),
  ApiServiceProvider(),

  /// Modules [Service Providers]
  AppServiceProvider(),
  IntegrationsServiceProvider(),
  AuthServiceProvider(),

  /// Modules [features]
  NewsServiceProvider(),
  AdServiceProvider(),
  CityServiceProvider(),
  ServiceProviderServiceProvider(),
  OpportunityServiceProvider(),
  OfferServiceProvider(),
  ServiceProviderCategoryServiceProvider(),
];
