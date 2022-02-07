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
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    ActivationRoute.name: (routeData) {
      final args = routeData.argsAs<ActivationRouteArgs>(
          orElse: () => const ActivationRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ActivationPage(fromForget: args.fromForget, key: args.key));
    },
    CompleteProfileRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const CompleteProfilePage());
    },
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LoginPage());
    },
    RegistrationRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const RegistrationPage());
    },
    ResetPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ResetPasswordPage(
              key: args.key,
              mobile: args.mobile,
              code: args.code,
              onSuccess: args.onSuccess));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(LaunchRoute.name, path: '/'),
        RouteConfig(HomeRoute.name, path: '/home-page'),
        RouteConfig(ActivationRoute.name, path: '/activation-page'),
        RouteConfig(CompleteProfileRoute.name, path: '/complete-profile-page'),
        RouteConfig(LoginRoute.name, path: '/login-page'),
        RouteConfig(RegistrationRoute.name, path: '/registration-page'),
        RouteConfig(ResetPasswordRoute.name, path: '/reset-password-page')
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
/// [ActivationPage]
class ActivationRoute extends PageRouteInfo<ActivationRouteArgs> {
  ActivationRoute({bool fromForget = false, Key? key})
      : super(ActivationRoute.name,
            path: '/activation-page',
            args: ActivationRouteArgs(fromForget: fromForget, key: key));

  static const String name = 'ActivationRoute';
}

class ActivationRouteArgs {
  const ActivationRouteArgs({this.fromForget = false, this.key});

  final bool fromForget;

  final Key? key;

  @override
  String toString() {
    return 'ActivationRouteArgs{fromForget: $fromForget, key: $key}';
  }
}

/// generated route for
/// [CompleteProfilePage]
class CompleteProfileRoute extends PageRouteInfo<void> {
  const CompleteProfileRoute()
      : super(CompleteProfileRoute.name, path: '/complete-profile-page');

  static const String name = 'CompleteProfileRoute';
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [RegistrationPage]
class RegistrationRoute extends PageRouteInfo<void> {
  const RegistrationRoute()
      : super(RegistrationRoute.name, path: '/registration-page');

  static const String name = 'RegistrationRoute';
}

/// generated route for
/// [ResetPasswordPage]
class ResetPasswordRoute extends PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute(
      {Key? key,
      required String mobile,
      required String code,
      required Function onSuccess})
      : super(ResetPasswordRoute.name,
            path: '/reset-password-page',
            args: ResetPasswordRouteArgs(
                key: key, mobile: mobile, code: code, onSuccess: onSuccess));

  static const String name = 'ResetPasswordRoute';
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs(
      {this.key,
      required this.mobile,
      required this.code,
      required this.onSuccess});

  final Key? key;

  final String mobile;

  final String code;

  final Function onSuccess;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{key: $key, mobile: $mobile, code: $code, onSuccess: $onSuccess}';
  }
}
