import 'dart:convert';

import 'package:bond/core/integration/dynamic_link_handler.dart';
import 'package:bond/features/post/data/models/post.dart';
import 'package:bond/routes/app_router.dart';
import 'package:one_studio_core/core.dart';

class PostDynamicLinkHandler extends DynamicLinkHandler {
  @override
  bool canHandle(Uri deepLink) {
    return deepLink.queryParameters['type'] == 'post';
  }

  @override
  Future<void> handle(Uri deepLink) async {
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
