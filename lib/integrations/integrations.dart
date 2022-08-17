import 'package:taleb/integrations/algolia.dart';

class Integrations {
  dynamic init() async {
    await AlgoliaInitialization.initAlgolia(
        appID: '0A41HQEK09', apiKey: '893fcfbbc5a0dced60085c21638488e6');
  }
}
