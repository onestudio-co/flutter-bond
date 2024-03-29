import 'package:bond/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/app_theme.dart';
import 'features/app/app_providers.dart';

class BondApp extends ConsumerWidget {
  const BondApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localProvider);
    final theme = ref.watch(themeProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      locale: locale,
      supportedLocales: const [Locale('ar'), Locale('en')],
      debugShowCheckedModeBanner: true,
      theme: appLightThemeData(),
      darkTheme: appDarkThemeData(),
      themeMode: theme,
    );
  }
}
