import 'package:bond/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/app_theme.dart';
import 'features/app/app_bloc.dart';

class BondApp extends StatelessWidget {
  const BondApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBloc = context.watch<AppBloc>();
    return MaterialApp.router(
      routerConfig: goRouter,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      locale: appBloc.state.currentLocale,
      supportedLocales: const [Locale('ar'), Locale('en')],
      debugShowCheckedModeBanner: true,
      theme: appLightThemeData(),
      darkTheme: appDarkThemeData(),
      themeMode: appBloc.state.currentThemeMode,
    );
  }
}
