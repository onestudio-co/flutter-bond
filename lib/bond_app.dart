import 'package:flutter/material.dart';

import 'core/app_theme.dart';
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
      theme: bondLightThemeData(context),
      darkTheme: bondDarkThemeData(context),
      themeMode: ThemeMode.system,
    );
  }
}
