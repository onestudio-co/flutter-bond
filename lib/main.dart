import 'package:fixit/routes/app_router.dart';
import 'package:flutter/material.dart';

import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(FixitApp(appRouter: sl<AppRouter>()));
}

class FixitApp extends StatelessWidget {
  const FixitApp({Key? key, required this.appRouter}) : super(key: key);

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
