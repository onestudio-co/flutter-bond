import 'package:flutter/material.dart';

import 'routes/app_router.dart';
import 'environment/config_reader.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();
  await ConfigReader.initialize();
  runApp(FixitApp());
}

class FixitApp extends StatelessWidget {
  final _appRouter = AppRouter();

  FixitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
