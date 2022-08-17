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
  _$AppRouter(
      {GlobalKey<NavigatorState>? navigatorKey, required this.authGuard})
      : super(navigatorKey);

  final AuthGuard authGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    LaunchRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LaunchPage());
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LoginPage());
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
      return CustomPage<Search>(
          routeData: routeData,
          child: FilterNewsPage(newsCubit: args.newsCubit, key: args.key),
          customRouteBuilder: RouterHelpers.modalSheetBuilder,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(LaunchRoute.name, path: '/'),
        RouteConfig(HomeRoute.name, path: '/home-page', guards: [authGuard]),
        RouteConfig(LoginRoute.name, path: '/login-page'),
        RouteConfig(SearviceProviderNewsRoute.name,
            path: '/searvice-provider-news-page'),
        RouteConfig(NewsDetailsRoute.name, path: '/news-details-page'),
        RouteConfig(SearchCityRoute.name, path: '/search-city-page'),
        RouteConfig(SearchSearviceProviderRoute.name,
            path: '/search-searvice-provider-page'),
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
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-page');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
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
