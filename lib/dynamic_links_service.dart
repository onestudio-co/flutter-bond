import 'dart:convert';

import 'package:bond/features/post/data/models/post.dart';
import 'package:bond/routes/app_router.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:one_studio_core/core.dart';

class DynamicLinksService {
  static Future<String> createDynamicLink(String type, String parameter) async {
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
        await FirebaseDynamicLinks.instance.buildShortLink(
      parameters,
    );
    final Uri shortUrl = shortDynamicLink.shortUrl;

    return shortUrl.toString();
  }

  static void initDynamicLinks() async {
    await Future.delayed(const Duration(seconds: 2));
    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    if (appRouter.stack.isEmpty) {
      _handleDynamicLink(data);
    }

    FirebaseDynamicLinks.instance.onLink.listen((PendingDynamicLinkData? data) {
      _handleDynamicLink(data);
      return;
    }).onError((error) {});
  }

  static Future<void> _handleDynamicLink(PendingDynamicLinkData? data) async {
    if (data == null) {
      return;
    }
    final Uri deepLink = data.link;
    if (deepLink.queryParameters['type'] == 'post') {
      String credentials = deepLink.queryParameters['data'] ?? '';
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      String decoded = stringToBase64.decode(credentials);
      Post post = Post.fromJson(jsonDecode(decoded));
      if (sl<AppRouter>().currentPath == '/post-details-page') {
        return;
      }
      appRouter.push(PostDetailsRoute(post: post));
    }
  }
}
