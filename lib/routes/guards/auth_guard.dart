import 'package:auto_route/auto_route.dart';
import 'package:one_studio_core/core.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    if (Auth.check()) {
      resolver.next(true);
    } else {
      // TODO: Push to LoginPage if user not Authorized.
    }
  }
}
