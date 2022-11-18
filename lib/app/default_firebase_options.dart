import 'package:firebase_core/firebase_core.dart';

import '../firebase_options_production.dart' as production;
import '../firebase_options_staging.dart' as staging;
import 'environment.dart';

class DefaultFirebaseOptions {
  static Future<FirebaseOptions> get currentPlatform async {
    final currentEnvironment = await Environment.current;
    switch (currentEnvironment) {
      case EnvironmentType.staging:
        return staging.DefaultFirebaseOptions.currentPlatform;
      case EnvironmentType.production:
        return production.DefaultFirebaseOptions.currentPlatform;
    }
  }
}
