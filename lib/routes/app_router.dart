import 'package:auto_route/auto_route.dart';
import 'package:fixit/features/auth/presentation/activation/activation_page.dart';
import 'package:fixit/features/auth/presentation/complete_registeration/complete_registeration_page.dart';
import 'package:fixit/features/auth/presentation/login/login_page.dart';
import 'package:fixit/features/auth/presentation/register/register_page.dart';
import 'package:fixit/features/auth/routes.dart';
import 'package:fixit/features/home/home_page.dart';
import 'package:fixit/routes/guards/auth_guard.dart';
import 'package:flutter/cupertino.dart';

import '../features/app/launch_page.dart';
import '../features/auth/presentation/reset_password/reset_password_page.dart';

part 'app_router.gr.dart';

final appRouter = AppRouter(AuthGuard());

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