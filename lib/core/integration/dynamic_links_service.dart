import 'package:bond/core/integration/handlers_link.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class DynamicLinksService {
  DynamicLinksService({required this.firebaseDynamicLinks});

  FirebaseDynamicLinks firebaseDynamicLinks;

  Future<String> createDynamicLink(String type, String parameter) async {
    String uriPrefix = 'https://onestudiobond.page.link';

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: uriPrefix,
      link: Uri.parse(
          'https://onestudiobond.page.link/?type=$type&data=$parameter'),
      androidParameters: const AndroidParameters(
          packageName: 'sa.example.bond', minimumVersion: 1),
      navigationInfoParameters:
          const NavigationInfoParameters(forcedRedirectEnabled: true),
      iosParameters: const IOSParameters(bundleId: 'sa.example.bond'),
    );

    final ShortDynamicLink shortDynamicLink =
        await firebaseDynamicLinks.buildShortLink(
      parameters,
    );
    final Uri shortUrl = shortDynamicLink.shortUrl;

    return shortUrl.toString();
  }

  void getDynamicLinks() async {
    final data = await firebaseDynamicLinks.getInitialLink();
    _handleDynamicLink(data);

    listenOnFirebaseDynamicLink();
  }

  void listenOnFirebaseDynamicLink() {
    firebaseDynamicLinks.onLink.listen((PendingDynamicLinkData? data) {
      _handleDynamicLink(data);
      return;
    }).onError((error) {});
  }


  Future<void> _handleDynamicLink(PendingDynamicLinkData? data) async {
    if (data == null) {
      return;
    }
    final Uri deepLink = data.link;
    for (final handler in handlers) {
      if (handler.canHandle(deepLink)) {
        await handler.handle(deepLink);
        return;
      }
    }
  }
}
