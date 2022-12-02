import 'package:auto_route/auto_route.dart';
import 'package:bond/features/auth/auth.dart';
import 'package:bond/routes/app_router.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    if (Auth.check()) {
      resolver.next(true);
    } else {
      final result = await router.push<bool>(const LoginRoute());
      resolver.next(result ?? false);
    }
  }
}
