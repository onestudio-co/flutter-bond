import 'package:auto_route/auto_route.dart';
import 'package:fixit/features/auth/data/datasources/auth_local_data_source.dart';

import '../injection_container.dart';
import 'app_router.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    final AuthLocalDataSource localDataSource = sl<AuthLocalDataSource>();
    if (localDataSource.hasToken()) {
      resolver.next(true);
    } else {
      router.push(LoginRoute(onResult: (bool success) {
        resolver.next(success);
      }));
    }
  }
}
