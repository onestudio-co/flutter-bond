import 'package:bond/config/environments.dart';
import 'package:firebase_core/firebase_core.dart';

import '../firebase_options_production.dart' as production;
import '../firebase_options_staging.dart' as staging;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    final currentEnvironment = Environments.current;
    switch (currentEnvironment) {
      case EnvironmentType.staging:
        return staging.DefaultFirebaseOptions.currentPlatform;
      case EnvironmentType.production:
        return production.DefaultFirebaseOptions.currentPlatform;
    }
  }
}
