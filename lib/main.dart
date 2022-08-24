import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/routes/app_router.dart';
import 'package:taleb/taleb_app.dart';

import 'generator/langs/codegen_loader.g.dart';
import 'injection_container.dart';
import 'integrations/integrations.dart';

/*
* This Command to generate translation keys
* FIRST: [fvm flutter pub run easy_localization:generate -S "assets/langs" -O "lib/generator/langs"]
* SECOND: [fvm flutter pub run easy_localization:generate -S "assets/langs" -O "lib/generator/langs" -o "locale_keys.g.dart" -f keys]
* */
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await init();
  await sl<Integrations>().init();
  runApp(
    EasyLocalization(
      supportedLocales: const <Locale>[
        Locale('en'),
        Locale('ar'),
      ],
      startLocale: const Locale('ar'),
      fallbackLocale: const Locale('ar'),
      path: 'assets/langs',
      assetLoader: const CodegenLoader(),
      child: TalebApp(appRouter: sl<AppRouter>()),
    ),
  );
}
