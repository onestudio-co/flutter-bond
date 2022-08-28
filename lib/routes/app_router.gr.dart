// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    LaunchRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LaunchPage());
    },
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LoginPage());
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    OfferDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<OfferDetailsRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: OfferDetailsPage(offer: args.offer, key: args.key));
    },
    ServiceProviderOffersTabBarRoute.name: (routeData) {
      final args = routeData.argsAs<ServiceProviderOffersTabBarRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              ServiceProviderOffersTabBarPage(user: args.user, key: args.key));
    },
    FilterOfferRoute.name: (routeData) {
      final args = routeData.argsAs<FilterOfferRouteArgs>();
      return CustomPage<int>(
          routeData: routeData,
          child: FilterOfferPage(offersCubit: args.offersCubit, key: args.key),
          customRouteBuilder: RouterHelpers.modalSheetBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    SearviceProviderNewsRoute.name: (routeData) {
      final args = routeData.argsAs<SearviceProviderNewsRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: SearviceProviderNewsPage(
              searviceProviderId: args.searviceProviderId, key: args.key));
    },
    NewsDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<NewsDetailsRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: NewsDetailsPage(news: args.news, key: args.key));
    },
    OpportunityDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<OpportunityDetailsRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: OpportunityDetailsPage(
              opportunity: args.opportunity, key: args.key));
    },
    SearchCityRoute.name: (routeData) {
      return CustomPage<int>(
          routeData: routeData,
          child: const SearchCityPage(),
          customRouteBuilder: RouterHelpers.modalSheetBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    SearchSearviceProviderRoute.name: (routeData) {
      return CustomPage<int>(
          routeData: routeData,
          child: const SearchSearviceProviderPage(),
          customRouteBuilder: RouterHelpers.modalSheetBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    FilterNewsRoute.name: (routeData) {
      final args = routeData.argsAs<FilterNewsRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: FilterNewsPage(newsCubit: args.newsCubit, key: args.key),
          customRouteBuilder: RouterHelpers.modalSheetBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    FilterOpportunityRoute.name: (routeData) {
      final args = routeData.argsAs<FilterOpportunityRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: FilterOpportunityPage(
              opportunityCubit: args.opportunityCubit, key: args.key),
          customRouteBuilder: RouterHelpers.modalSheetBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    NewsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const NewsPage());
    },
    OffersRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const OffersPage());
    },
    OpportunitiesRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const OpportunitiesPage());
    },
    ServiceProviderOffersDetailsTabRoute.name: (routeData) {
      final args = routeData.argsAs<ServiceProviderOffersDetailsTabRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ServiceProviderOffersDetailsTabPage(
              user: args.user, key: args.key));
    },
    ServiceProviderOffersOffersTabRoute.name: (routeData) {
      final args = routeData.argsAs<ServiceProviderOffersOffersTabRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ServiceProviderOffersOffersTabPage(
              user: args.user, key: args.key));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(LaunchRoute.name, path: '/'),
        RouteConfig(LoginRoute.name, path: '/login-page'),
        RouteConfig(HomeRoute.name, path: '/home-page', children: [
          RouteConfig(NewsRoute.name,
              path: 'news-page', parent: HomeRoute.name),
          RouteConfig(OffersRoute.name,
              path: 'offers-page', parent: HomeRoute.name),
          RouteConfig(OpportunitiesRoute.name,
              path: 'opportunities-page', parent: HomeRoute.name)
        ]),
        RouteConfig(OfferDetailsRoute.name, path: '/offer-details-page'),
        RouteConfig(ServiceProviderOffersTabBarRoute.name,
            path: '/service-provider-offers-tab-bar-page',
            children: [
              RouteConfig(ServiceProviderOffersDetailsTabRoute.name,
                  path: 'service-provider-offers-details-tab-page',
                  parent: ServiceProviderOffersTabBarRoute.name),
              RouteConfig(ServiceProviderOffersOffersTabRoute.name,
                  path: 'service-provider-offers-offers-tab-page',
                  parent: ServiceProviderOffersTabBarRoute.name)
            ]),
        RouteConfig(FilterOfferRoute.name, path: '/filter-offer-page'),
        RouteConfig(SearviceProviderNewsRoute.name,
            path: '/searvice-provider-news-page'),
        RouteConfig(NewsDetailsRoute.name, path: '/news-details-page'),
        RouteConfig(OpportunityDetailsRoute.name,
            path: '/opportunity-details-page'),
        RouteConfig(SearchCityRoute.name, path: '/search-city-page'),
        RouteConfig(SearchSearviceProviderRoute.name,
            path: '/search-searvice-provider-page'),
        RouteConfig(FilterNewsRoute.name, path: '/filter-news-page'),
        RouteConfig(FilterOpportunityRoute.name,
            path: '/filter-opportunity-page')
      ];
}

/// generated route for
/// [LaunchPage]
class LaunchRoute extends PageRouteInfo<void> {
  const LaunchRoute() : super(LaunchRoute.name, path: '/');

  static const String name = 'LaunchRoute';
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/home-page', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [OfferDetailsPage]
class OfferDetailsRoute extends PageRouteInfo<OfferDetailsRouteArgs> {
  OfferDetailsRoute({required Offer offer, Key? key})
      : super(OfferDetailsRoute.name,
            path: '/offer-details-page',
            args: OfferDetailsRouteArgs(offer: offer, key: key));

  static const String name = 'OfferDetailsRoute';
}

class OfferDetailsRouteArgs {
  const OfferDetailsRouteArgs({required this.offer, this.key});

  final Offer offer;

  final Key? key;

  @override
  String toString() {
    return 'OfferDetailsRouteArgs{offer: $offer, key: $key}';
  }
}

/// generated route for
/// [ServiceProviderOffersTabBarPage]
class ServiceProviderOffersTabBarRoute
    extends PageRouteInfo<ServiceProviderOffersTabBarRouteArgs> {
  ServiceProviderOffersTabBarRoute(
      {required User user, Key? key, List<PageRouteInfo>? children})
      : super(ServiceProviderOffersTabBarRoute.name,
            path: '/service-provider-offers-tab-bar-page',
            args: ServiceProviderOffersTabBarRouteArgs(user: user, key: key),
            initialChildren: children);

  static const String name = 'ServiceProviderOffersTabBarRoute';
}

class ServiceProviderOffersTabBarRouteArgs {
  const ServiceProviderOffersTabBarRouteArgs({required this.user, this.key});

  final User user;

  final Key? key;

  @override
  String toString() {
    return 'ServiceProviderOffersTabBarRouteArgs{user: $user, key: $key}';
  }
}

/// generated route for
/// [FilterOfferPage]
class FilterOfferRoute extends PageRouteInfo<FilterOfferRouteArgs> {
  FilterOfferRoute({required OffersCubit offersCubit, Key? key})
      : super(FilterOfferRoute.name,
            path: '/filter-offer-page',
            args: FilterOfferRouteArgs(offersCubit: offersCubit, key: key));

  static const String name = 'FilterOfferRoute';
}

class FilterOfferRouteArgs {
  const FilterOfferRouteArgs({required this.offersCubit, this.key});

  final OffersCubit offersCubit;

  final Key? key;

  @override
  String toString() {
    return 'FilterOfferRouteArgs{offersCubit: $offersCubit, key: $key}';
  }
}

/// generated route for
/// [SearviceProviderNewsPage]
class SearviceProviderNewsRoute
    extends PageRouteInfo<SearviceProviderNewsRouteArgs> {
  SearviceProviderNewsRoute({required int searviceProviderId, Key? key})
      : super(SearviceProviderNewsRoute.name,
            path: '/searvice-provider-news-page',
            args: SearviceProviderNewsRouteArgs(
                searviceProviderId: searviceProviderId, key: key));

  static const String name = 'SearviceProviderNewsRoute';
}

class SearviceProviderNewsRouteArgs {
  const SearviceProviderNewsRouteArgs(
      {required this.searviceProviderId, this.key});

  final int searviceProviderId;

  final Key? key;

  @override
  String toString() {
    return 'SearviceProviderNewsRouteArgs{searviceProviderId: $searviceProviderId, key: $key}';
  }
}

/// generated route for
/// [NewsDetailsPage]
class NewsDetailsRoute extends PageRouteInfo<NewsDetailsRouteArgs> {
  NewsDetailsRoute({required News news, Key? key})
      : super(NewsDetailsRoute.name,
            path: '/news-details-page',
            args: NewsDetailsRouteArgs(news: news, key: key));

  static const String name = 'NewsDetailsRoute';
}

class NewsDetailsRouteArgs {
  const NewsDetailsRouteArgs({required this.news, this.key});

  final News news;

  final Key? key;

  @override
  String toString() {
    return 'NewsDetailsRouteArgs{news: $news, key: $key}';
  }
}

/// generated route for
/// [OpportunityDetailsPage]
class OpportunityDetailsRoute
    extends PageRouteInfo<OpportunityDetailsRouteArgs> {
  OpportunityDetailsRoute({required Opportunity opportunity, Key? key})
      : super(OpportunityDetailsRoute.name,
            path: '/opportunity-details-page',
            args: OpportunityDetailsRouteArgs(
                opportunity: opportunity, key: key));

  static const String name = 'OpportunityDetailsRoute';
}

class OpportunityDetailsRouteArgs {
  const OpportunityDetailsRouteArgs({required this.opportunity, this.key});

  final Opportunity opportunity;

  final Key? key;

  @override
  String toString() {
    return 'OpportunityDetailsRouteArgs{opportunity: $opportunity, key: $key}';
  }
}

/// generated route for
/// [SearchCityPage]
class SearchCityRoute extends PageRouteInfo<void> {
  const SearchCityRoute()
      : super(SearchCityRoute.name, path: '/search-city-page');

  static const String name = 'SearchCityRoute';
}

/// generated route for
/// [SearchSearviceProviderPage]
class SearchSearviceProviderRoute extends PageRouteInfo<void> {
  const SearchSearviceProviderRoute()
      : super(SearchSearviceProviderRoute.name,
            path: '/search-searvice-provider-page');

  static const String name = 'SearchSearviceProviderRoute';
}

/// generated route for
/// [FilterNewsPage]
class FilterNewsRoute extends PageRouteInfo<FilterNewsRouteArgs> {
  FilterNewsRoute({required NewsCubit newsCubit, Key? key})
      : super(FilterNewsRoute.name,
            path: '/filter-news-page',
            args: FilterNewsRouteArgs(newsCubit: newsCubit, key: key));

  static const String name = 'FilterNewsRoute';
}

class FilterNewsRouteArgs {
  const FilterNewsRouteArgs({required this.newsCubit, this.key});

  final NewsCubit newsCubit;

  final Key? key;

  @override
  String toString() {
    return 'FilterNewsRouteArgs{newsCubit: $newsCubit, key: $key}';
  }
}

/// generated route for
/// [FilterOpportunityPage]
class FilterOpportunityRoute extends PageRouteInfo<FilterOpportunityRouteArgs> {
  FilterOpportunityRoute({required OpportunityCubit opportunityCubit, Key? key})
      : super(FilterOpportunityRoute.name,
            path: '/filter-opportunity-page',
            args: FilterOpportunityRouteArgs(
                opportunityCubit: opportunityCubit, key: key));

  static const String name = 'FilterOpportunityRoute';
}

class FilterOpportunityRouteArgs {
  const FilterOpportunityRouteArgs({required this.opportunityCubit, this.key});

  final OpportunityCubit opportunityCubit;

  final Key? key;

  @override
  String toString() {
    return 'FilterOpportunityRouteArgs{opportunityCubit: $opportunityCubit, key: $key}';
  }
}

/// generated route for
/// [NewsPage]
class NewsRoute extends PageRouteInfo<void> {
  const NewsRoute() : super(NewsRoute.name, path: 'news-page');

  static const String name = 'NewsRoute';
}

/// generated route for
/// [OffersPage]
class OffersRoute extends PageRouteInfo<void> {
  const OffersRoute() : super(OffersRoute.name, path: 'offers-page');

  static const String name = 'OffersRoute';
}

/// generated route for
/// [OpportunitiesPage]
class OpportunitiesRoute extends PageRouteInfo<void> {
  const OpportunitiesRoute()
      : super(OpportunitiesRoute.name, path: 'opportunities-page');

  static const String name = 'OpportunitiesRoute';
}

/// generated route for
/// [ServiceProviderOffersDetailsTabPage]
class ServiceProviderOffersDetailsTabRoute
    extends PageRouteInfo<ServiceProviderOffersDetailsTabRouteArgs> {
  ServiceProviderOffersDetailsTabRoute({required User user, Key? key})
      : super(ServiceProviderOffersDetailsTabRoute.name,
            path: 'service-provider-offers-details-tab-page',
            args:
                ServiceProviderOffersDetailsTabRouteArgs(user: user, key: key));

  static const String name = 'ServiceProviderOffersDetailsTabRoute';
}

class ServiceProviderOffersDetailsTabRouteArgs {
  const ServiceProviderOffersDetailsTabRouteArgs(
      {required this.user, this.key});

  final User user;

  final Key? key;

  @override
  String toString() {
    return 'ServiceProviderOffersDetailsTabRouteArgs{user: $user, key: $key}';
  }
}

/// generated route for
/// [ServiceProviderOffersOffersTabPage]
class ServiceProviderOffersOffersTabRoute
    extends PageRouteInfo<ServiceProviderOffersOffersTabRouteArgs> {
  ServiceProviderOffersOffersTabRoute({required User user, Key? key})
      : super(ServiceProviderOffersOffersTabRoute.name,
            path: 'service-provider-offers-offers-tab-page',
            args:
                ServiceProviderOffersOffersTabRouteArgs(user: user, key: key));

  static const String name = 'ServiceProviderOffersOffersTabRoute';
}

class ServiceProviderOffersOffersTabRouteArgs {
  const ServiceProviderOffersOffersTabRouteArgs({required this.user, this.key});

  final User user;

  final Key? key;

  @override
  String toString() {
    return 'ServiceProviderOffersOffersTabRouteArgs{user: $user, key: $key}';
  }
}
