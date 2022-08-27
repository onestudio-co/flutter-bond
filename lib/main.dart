import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/routes/app_router.dart';
import 'package:taleb/taleb_app.dart';

import 'generator/langs/codegen_loader.g.dart';
import 'injection_container.dart';
import 'integrations/integrations.dart';

String url =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf7hTSBTHNqnjAKmk3WjoPbsDbGx66_dGHcWt24uQMo3cdK9UvGId0nmD57nncxKnkPB0&usqp=CAU';
String adsUrl =
    'https://cdn.searchenginejournal.com/wp-content/uploads/2020/01/responsive-display-ads-5e260c98e00db-1520x800.jpg';

/*
* This Command to generate translation keys
* FIRST: [fvm flutter pub run easy_localization:generate -S "assets/langs" -O "lib/generator/langs"]
* SECOND: [fvm flutter pub run easy_localization:generate -S "assets/langs" -O "lib/generator/langs" -o "locale_keys.g.dart" -f keys]
* THIRD: [fvm flutter pub run build_runner build --delete-conflicting-outputs]
*
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
