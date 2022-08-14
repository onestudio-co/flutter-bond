import 'dart:io';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_studio_core/core.dart';
import 'package:one_studio_core/external_packages.dart';
import 'package:taleb/core/theme/bond_light_theme_data.dart';
import 'package:taleb/routes/app_router.dart';

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
      startLocale:  const Locale('ar'),
      fallbackLocale: const Locale('en'),
      path: 'assets/langs',
      child: TalebApp(appRouter: sl<AppRouter>()),
    ),
  );
}

class TalebApp extends StatelessWidget {
  const TalebApp({required this.appRouter, Key? key}) : super(key: key);

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) => MaterialApp.router(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: Platform.isIOS ? 1.0 : 1.1,
            ),
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
        theme: talebLightThemeData(),
      ),
    );
  }
}
