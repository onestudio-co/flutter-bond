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
    SearchTabBarRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SearchTabBarPage());
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
      return CustomPage<City>(
          routeData: routeData,
          child: const SearchCityPage(),
          customRouteBuilder: RouterHelpers.modalSheetBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    SearchSearviceProviderRoute.name: (routeData) {
      return CustomPage<User>(
          routeData: routeData,
          child: const SearchSearviceProviderPage(),
          customRouteBuilder: RouterHelpers.modalSheetBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    ServiceProviderCategoriesRoute.name: (routeData) {
      return CustomPage<ServiceProviderCategory>(
          routeData: routeData,
          child: const ServiceProviderCategoriesPage(),
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
    MainRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const MainPage());
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
    },
    SearchOpportunitiesRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SearchOpportunitiesPage());
    },
    SearchOffersRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SearchOffersPage());
    },
    SearchNewsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SearchNewsPage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(LaunchRoute.name, path: '/'),
        RouteConfig(LoginRoute.name, path: '/login-page'),
        RouteConfig(HomeRoute.name, path: 'home', children: [
          RouteConfig(MainRoute.name, path: 'main', parent: HomeRoute.name),
          RouteConfig(NewsRoute.name, path: 'news', parent: HomeRoute.name),
          RouteConfig(OffersRoute.name, path: 'offers', parent: HomeRoute.name),
          RouteConfig(OpportunitiesRoute.name,
              path: 'opportunities', parent: HomeRoute.name)
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
        RouteConfig(SearchTabBarRoute.name,
            path: '/search-tab-bar-page',
            children: [
              RouteConfig(SearchOpportunitiesRoute.name,
                  path: 'home-search/opportunities',
                  parent: SearchTabBarRoute.name),
              RouteConfig(SearchOffersRoute.name,
                  path: 'home-search/offers', parent: SearchTabBarRoute.name),
              RouteConfig(SearchNewsRoute.name,
                  path: 'home-search/news', parent: SearchTabBarRoute.name)
            ]),
        RouteConfig(SearviceProviderNewsRoute.name,
            path: '/searvice-provider-news-page'),
        RouteConfig(NewsDetailsRoute.name, path: '/news-details-page'),
        RouteConfig(OpportunityDetailsRoute.name,
            path: '/opportunity-details-page'),
        RouteConfig(SearchCityRoute.name, path: '/search-city-page'),
        RouteConfig(SearchSearviceProviderRoute.name,
            path: '/search-searvice-provider-page'),
        RouteConfig(ServiceProviderCategoriesRoute.name,
            path: '/service-provider-categories-page'),
        RouteConfig(FilterNewsRoute.name, path: '/filter-news-page')
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
      : super(HomeRoute.name, path: 'home', initialChildren: children);

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
/// [SearchTabBarPage]
class SearchTabBarRoute extends PageRouteInfo<void> {
  const SearchTabBarRoute({List<PageRouteInfo>? children})
      : super(SearchTabBarRoute.name,
            path: '/search-tab-bar-page', initialChildren: children);

  static const String name = 'SearchTabBarRoute';
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
/// [ServiceProviderCategoriesPage]
class ServiceProviderCategoriesRoute extends PageRouteInfo<void> {
  const ServiceProviderCategoriesRoute()
      : super(ServiceProviderCategoriesRoute.name,
            path: '/service-provider-categories-page');

  static const String name = 'ServiceProviderCategoriesRoute';
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
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute() : super(MainRoute.name, path: 'main');

  static const String name = 'MainRoute';
}

/// generated route for
/// [NewsPage]
class NewsRoute extends PageRouteInfo<void> {
  const NewsRoute() : super(NewsRoute.name, path: 'news');

  static const String name = 'NewsRoute';
}

/// generated route for
/// [OffersPage]
class OffersRoute extends PageRouteInfo<void> {
  const OffersRoute() : super(OffersRoute.name, path: 'offers');

  static const String name = 'OffersRoute';
}

/// generated route for
/// [OpportunitiesPage]
class OpportunitiesRoute extends PageRouteInfo<void> {
  const OpportunitiesRoute()
      : super(OpportunitiesRoute.name, path: 'opportunities');

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

/// generated route for
/// [SearchOpportunitiesPage]
class SearchOpportunitiesRoute extends PageRouteInfo<void> {
  const SearchOpportunitiesRoute()
      : super(SearchOpportunitiesRoute.name, path: 'home-search/opportunities');

  static const String name = 'SearchOpportunitiesRoute';
}

/// generated route for
/// [SearchOffersPage]
class SearchOffersRoute extends PageRouteInfo<void> {
  const SearchOffersRoute()
      : super(SearchOffersRoute.name, path: 'home-search/offers');

  static const String name = 'SearchOffersRoute';
}

/// generated route for
/// [SearchNewsPage]
class SearchNewsRoute extends PageRouteInfo<void> {
  const SearchNewsRoute()
      : super(SearchNewsRoute.name, path: 'home-search/news');

  static const String name = 'SearchNewsRoute';
}
