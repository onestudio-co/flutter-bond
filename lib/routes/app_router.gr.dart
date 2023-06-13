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
  _$AppRouter({
    GlobalKey<NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final AuthGuard authGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return MaterialPageX<bool>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const RegisterPage(),
      );
    },
    UpdateAppRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateAppRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: UpdateAppPage(
          key: args.key,
          message: args.message,
        ),
      );
    },
    SoftUpdateRoute.name: (routeData) {
      final args = routeData.argsAs<SoftUpdateRouteArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: SoftUpdatePage(
          key: args.key,
          message: args.message,
        ),
        customRouteBuilder: RouterHelpers.modalSheetBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PostDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<PostDetailsRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PostDetailsPage(
          post: args.post,
          key: args.key,
        ),
      );
    },
    NotificationsRoute.name: (routeData) {
      final args = routeData.argsAs<NotificationsRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: NotificationsPage(
          notificationCenterProvider: args.notificationCenterProvider,
          key: args.key,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const HomePage()),
      );
    },
    MoreRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const MorePage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          MainRoute.name,
          path: '/',
          children: [
            RouteConfig(
              HomeRoute.name,
              path: 'home-page',
              parent: MainRoute.name,
            ),
            RouteConfig(
              MoreRoute.name,
              path: 'more-page',
              parent: MainRoute.name,
            ),
          ],
        ),
        RouteConfig(
          LoginRoute.name,
          path: '/login-page',
        ),
        RouteConfig(
          RegisterRoute.name,
          path: '/register-page',
        ),
        RouteConfig(
          UpdateAppRoute.name,
          path: 'update_app',
        ),
        RouteConfig(
          SoftUpdateRoute.name,
          path: '/soft-update-page',
        ),
        RouteConfig(
          PostDetailsRoute.name,
          path: '/post-details-page',
        ),
        RouteConfig(
          NotificationsRoute.name,
          path: '/notifications-page',
          guards: [authGuard],
        ),
      ];
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login-page',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: '/register-page',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [UpdateAppPage]
class UpdateAppRoute extends PageRouteInfo<UpdateAppRouteArgs> {
  UpdateAppRoute({
    Key? key,
    required String message,
  }) : super(
          UpdateAppRoute.name,
          path: 'update_app',
          args: UpdateAppRouteArgs(
            key: key,
            message: message,
          ),
        );

  static const String name = 'UpdateAppRoute';
}

class UpdateAppRouteArgs {
  const UpdateAppRouteArgs({
    this.key,
    required this.message,
  });

  final Key? key;

  final String message;

  @override
  String toString() {
    return 'UpdateAppRouteArgs{key: $key, message: $message}';
  }
}

/// generated route for
/// [SoftUpdatePage]
class SoftUpdateRoute extends PageRouteInfo<SoftUpdateRouteArgs> {
  SoftUpdateRoute({
    Key? key,
    required String message,
  }) : super(
          SoftUpdateRoute.name,
          path: '/soft-update-page',
          args: SoftUpdateRouteArgs(
            key: key,
            message: message,
          ),
        );

  static const String name = 'SoftUpdateRoute';
}

class SoftUpdateRouteArgs {
  const SoftUpdateRouteArgs({
    this.key,
    required this.message,
  });

  final Key? key;

  final String message;

  @override
  String toString() {
    return 'SoftUpdateRouteArgs{key: $key, message: $message}';
  }
}

/// generated route for
/// [PostDetailsPage]
class PostDetailsRoute extends PageRouteInfo<PostDetailsRouteArgs> {
  PostDetailsRoute({
    required Post post,
    Key? key,
  }) : super(
          PostDetailsRoute.name,
          path: '/post-details-page',
          args: PostDetailsRouteArgs(
            post: post,
            key: key,
          ),
        );

  static const String name = 'PostDetailsRoute';
}

class PostDetailsRouteArgs {
  const PostDetailsRouteArgs({
    required this.post,
    this.key,
  });

  final Post post;

  final Key? key;

  @override
  String toString() {
    return 'PostDetailsRouteArgs{post: $post, key: $key}';
  }
}

/// generated route for
/// [NotificationsPage]
class NotificationsRoute extends PageRouteInfo<NotificationsRouteArgs> {
  NotificationsRoute({
    required NotificationCenterProvider notificationCenterProvider,
    Key? key,
  }) : super(
          NotificationsRoute.name,
          path: '/notifications-page',
          args: NotificationsRouteArgs(
            notificationCenterProvider: notificationCenterProvider,
            key: key,
          ),
        );

  static const String name = 'NotificationsRoute';
}

class NotificationsRouteArgs {
  const NotificationsRouteArgs({
    required this.notificationCenterProvider,
    this.key,
  });

  final NotificationCenterProvider notificationCenterProvider;

  final Key? key;

  @override
  String toString() {
    return 'NotificationsRouteArgs{notificationCenterProvider: $notificationCenterProvider, key: $key}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [MorePage]
class MoreRoute extends PageRouteInfo<void> {
  const MoreRoute()
      : super(
          MoreRoute.name,
          path: 'more-page',
        );

  static const String name = 'MoreRoute';
}
