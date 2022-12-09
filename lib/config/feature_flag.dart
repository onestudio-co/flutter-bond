import 'package:bond/config/environments.dart';

class FeatureFlagConfig {
  static String defaultService = env('FEATURE_FLAG_SERVICE');

  static var services = {
    'splitio': {
      'mobile_key': env('SPLITIO_MOBILE_KEY'),
    }
  };
}
