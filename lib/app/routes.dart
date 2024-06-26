import 'package:bond/features/auth/routes.dart';
import 'package:bond/features/main/routes.dart';
import 'package:bond/features/notification/routes.dart';
import 'package:bond/features/post/routes.dart';
import 'package:bond/features/update_app/routes.dart';
import 'package:bond_core/bond_core.dart';
import 'package:go_router/go_router.dart';

final goRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/home',
  navigatorKey: appKey,
  routes: [
    ...mainRoutes,
    ...postRoutes,
    ...authRoutes,
    ...updateAppRoutes,
    ...notificationRoutes,
  ],
);
