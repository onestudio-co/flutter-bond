import 'package:fixit/routes/auth_guard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';

import 'injection_container.dart';
import 'routes/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();
  await FlutterConfig.loadEnvVariables();
  runApp(FixitApp());
}

class FixitApp extends StatelessWidget {
  final _appRouter = AppRouter(AuthGuard());

  FixitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
