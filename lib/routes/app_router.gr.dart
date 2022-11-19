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
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    LoginRoute.name: (routeData) {
      return MaterialPageX<bool>(
          routeData: routeData, child: const LoginPage());
    },
    RegisterRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const RegisterPage());
    },
    NotificationsRoute.name: (routeData) {
      final args = routeData.argsAs<NotificationsRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: NotificationsPage(
              notificationCenterProvider: args.notificationCenterProvider,
              key: args.key));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomeRoute.name, path: '/', guards: [authGuard]),
        RouteConfig(LoginRoute.name, path: '/login-page'),
        RouteConfig(RegisterRoute.name, path: '/register-page'),
        RouteConfig(NotificationsRoute.name, path: '/notifications-page')
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register-page');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [NotificationsPage]
class NotificationsRoute extends PageRouteInfo<NotificationsRouteArgs> {
  NotificationsRoute(
      {required NotificationCenterProvider notificationCenterProvider,
      Key? key})
      : super(NotificationsRoute.name,
            path: '/notifications-page',
            args: NotificationsRouteArgs(
                notificationCenterProvider: notificationCenterProvider,
                key: key));

  static const String name = 'NotificationsRoute';
}

class NotificationsRouteArgs {
  const NotificationsRouteArgs(
      {required this.notificationCenterProvider, this.key});

  final NotificationCenterProvider notificationCenterProvider;

  final Key? key;

  @override
  String toString() {
    return 'NotificationsRouteArgs{notificationCenterProvider: $notificationCenterProvider, key: $key}';
  }
}
