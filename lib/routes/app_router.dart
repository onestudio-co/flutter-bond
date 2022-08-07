import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taleb/features/auth/presentation/login_page.dart';

import '../features/app/launch_page.dart';
import '../features/auth/routes.dart';
import '../features/home/home_page.dart';
import 'guards/auth_guard.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LaunchPage, initial: true),
    AutoRoute(page: HomePage, guards: [AuthGuard]),
    ...authRoutes,
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter(AuthGuard authGuard) : super(authGuard: authGuard);
}
