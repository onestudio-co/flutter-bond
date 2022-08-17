import 'dart:developer';

import 'package:algolia/algolia.dart';

class AlgoliaInitialization {
  static Algolia? algoliaObject;

  static Future<void> initAlgolia(
      {required String appID, required String apiKey}) async {
    try {
      algoliaObject = Algolia.init(
        applicationId: appID,
        apiKey: apiKey,
      );
    } catch (error) {
      log('algolia Error $error');
    }
  }
}
