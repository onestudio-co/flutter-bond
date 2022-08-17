import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taleb/features/auth/presentation/login_page.dart';
import 'package:taleb/features/city/data/models/city.dart';
import 'package:taleb/features/city/presentations/search_city_page.dart';
import 'package:taleb/features/home/news/data/models/news.dart';
import 'package:taleb/features/home/news/presentations/news_details/news_details_page.dart';
import 'package:taleb/features/home/news/presentations/searvice_provider_news/searvice_provider_page.dart';
import 'package:taleb/routes/router_helpers.dart';

import '../features/app/launch_page.dart';
import '../features/auth/routes.dart';
import '../features/home/home_page.dart';
import 'guards/auth_guard.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LaunchPage, initial: true),
    AutoRoute(page: HomePage, guards: <Type>[AuthGuard]),
    ...authRoutes,
    AutoRoute(page: SearviceProviderNewsPage),
    AutoRoute(page: NewsDetailsPage),
    CustomRoute<City>(
      page: SearchCityPage,
      customRouteBuilder: RouterHelpers.modalSheetBuilder,
    ),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter(AuthGuard authGuard) : super(authGuard: authGuard);
}
