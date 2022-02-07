import 'package:auto_route/auto_route.dart';
import 'package:fixit/routes/app_router.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (authenitcated) {
      resolver.next(true);
    } else {
      router.push(LoginRoute(onResult: (){

      }));
    }
  }
}
