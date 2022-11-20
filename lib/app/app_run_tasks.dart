import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:one_studio_core/core.dart';
import 'package:universal_platform/universal_platform.dart';

import 'default_firebase_options.dart';
import 'injection_container.dart';

class RunAppTasks extends RunTasks {
  @override
  Future<void> beforeRun(WidgetsBinding widgetsBinding) async {
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    final firebaseOptions = await DefaultFirebaseOptions.currentPlatform;
    await Firebase.initializeApp(options: firebaseOptions);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    await init();
    FlutterNativeSplash.remove();
  }

  @override
  Future<void> afterRun() async {
    if (UniversalPlatform.isAndroid) {
      const AndroidNotificationChannel channel = AndroidNotificationChannel(
        'high_importance_channel', // id
        'Bond', // title
        description:
            'This channel is used for important notifications.', // description
        importance: Importance.max,
      );

      final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();

      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);
    }
    sl<PushNotificationsProviders>().listen();
    if (Auth.check()) {
      sl<NotificationCenterProvider>().load();
      sl<NotificationCenterProvider>().listen();
    }
  }

  @override
  void onError(Object error, StackTrace stack) {
    log(stack.toString());
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  }
}
