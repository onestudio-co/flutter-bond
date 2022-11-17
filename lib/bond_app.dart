import 'package:flutter/material.dart';

import 'core/theme/bond_light_theme_data.dart';
import 'routes/app_router.dart';

class BondApp extends StatelessWidget {
  const BondApp({Key? key, required this.appRouter}) : super(key: key);

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar'), Locale('en')],
      debugShowCheckedModeBanner: true,
      routerDelegate: appRouter.delegate(
        navigatorObservers: navigatorObservers,
      ),
      routeInformationParser: appRouter.defaultRouteParser(),
      theme: bondLightThemeData(),
    );
  }
}
