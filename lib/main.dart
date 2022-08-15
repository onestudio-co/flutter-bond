import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/routes/app_router.dart';
import 'package:taleb/taleb_app.dart';

import 'injection_container.dart';

String url =
    'https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
String adsUrl =
    'https://cdn.searchenginejournal.com/wp-content/uploads/2020/01/responsive-display-ads-5e260c98e00db-1520x800.jpg';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await init();
  runApp(
    EasyLocalization(
      supportedLocales: const <Locale>[
        Locale('en'),
        Locale('ar'),
      ],
      startLocale: const Locale('ar'),
      fallbackLocale: const Locale('en'),
      path: 'assets/langs',
      child: TalebApp(appRouter: sl<AppRouter>()),
    ),
  );
}
