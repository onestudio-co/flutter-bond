import 'dart:async';

import 'package:bond/routes/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:one_studio_core/core.dart';

import 'bond_app.dart';
import 'firebase_options_staging.dart';
import 'injection_container.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      FlutterError.onError =
          FirebaseCrashlytics.instance.recordFlutterFatalError;

      await init();
      FlutterNativeSplash.remove();
      runApp(BondApp(appRouter: sl<AppRouter>()));
    },
    (error, stack) =>
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true),
  );
}
