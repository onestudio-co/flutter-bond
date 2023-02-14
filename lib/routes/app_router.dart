library app_router;

import 'package:auto_route/auto_route.dart';
import 'package:bond/core/remote_config/routes.dart';
import 'package:bond/features/auth/auth.dart';
import 'package:bond/features/notification/presentations/ui/notifications_page.dart';
import 'package:bond/features/post/presentation/home_page.dart';
import 'package:bond/routes/guards/auth_guard.dart';
import 'package:bond/routes/router_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:one_studio_core/core.dart';

import '../features/collections/presentation/collections_page.dart';
import '../features/main/presentation/main_page.dart';
import '../features/main/routes.dart';
import '../features/more/presentation/more_page.dart';

export 'guards/auth_guard.dart';
export 'observers/navigator_observers.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    ...mainRoutes,
    ...authRoutes,
    ...integrationsRoutes,
    AutoRoute(page: NotificationsPage, guards: [AuthGuard]),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter(AuthGuard authGuard) : super(authGuard: authGuard);
}
