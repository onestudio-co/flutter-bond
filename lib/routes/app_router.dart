import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taleb/features/auth/presentation/login_page.dart';
import 'package:taleb/features/city/presentations/search_city_page.dart';
import 'package:taleb/features/home/home_bottom_nav_bar/home_page.dart';
import 'package:taleb/features/home/home_bottom_nav_bar/routes.dart';
import 'package:taleb/features/home/news/data/models/news.dart';
import 'package:taleb/features/home/news/presentations/all_news/cubit/news_cubit.dart';
import 'package:taleb/features/home/news/presentations/all_news/news_page.dart';
import 'package:taleb/features/home/news/presentations/all_news/widget/filter_news_page.dart';
import 'package:taleb/features/home/news/presentations/news_details/news_details_page.dart';
import 'package:taleb/features/home/news/presentations/searvice_provider_news/searvice_provider_page.dart';
import 'package:taleb/features/home/offer/offer_imports.dart';
import 'package:taleb/features/home/offer/presentations/offer_details/offer_details_page.dart';
import 'package:taleb/features/home/offer/presentations/offers/offers_page.dart';
import 'package:taleb/features/home/offer/presentations/service_provider_offer/tabs/offer_service_provider_offers_tab_bar_page.dart';
import 'package:taleb/features/home/offer/routes.dart';
import 'package:taleb/features/home/opportunities/data/models/opportunity.dart';
import 'package:taleb/features/home/opportunities/presentations/all_opportunities/all_opportunities_page.dart';
import 'package:taleb/features/home/opportunities/presentations/all_opportunities/cubit/opportunity_cubit.dart';
import 'package:taleb/features/home/opportunities/presentations/all_opportunities/widgets/filter_opportunity_page.dart';
import 'package:taleb/features/home/opportunities/presentations/opportunity_details/opportunity_details_page.dart';
import 'package:taleb/features/service_provider/presentations/search_searvice_provider_page.dart';
import 'package:taleb/routes/router_helpers.dart';

import '../features/app/launch_page.dart';
import '../features/auth/routes.dart';
import 'guards/auth_guard.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  preferRelativeImports: true,
  routes: <AutoRoute>[
    AutoRoute(page: LaunchPage, initial: true),
    ...authRoutes,
    ...homeBottomNavBarRoutes,
    ...offerRoutes,
    AutoRoute(page: SearviceProviderNewsPage),
    AutoRoute(page: NewsDetailsPage),
    AutoRoute(page: OpportunityDetailsPage),
    CustomRoute<int>(
      page: SearchCityPage,
      customRouteBuilder: RouterHelpers.modalSheetBuilder,
    ),
    CustomRoute<int>(
      page: SearchSearviceProviderPage,
      customRouteBuilder: RouterHelpers.modalSheetBuilder,
    ),
    CustomRoute(
      page: FilterNewsPage,
      customRouteBuilder: RouterHelpers.modalSheetBuilder,
    ),
    CustomRoute(
      page: FilterOpportunityPage,
      customRouteBuilder: RouterHelpers.modalSheetBuilder,
    ),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter(AuthGuard authGuard) : super();
}
