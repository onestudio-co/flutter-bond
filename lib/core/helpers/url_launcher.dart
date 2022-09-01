import 'package:taleb/core/helpers/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  UrlLauncher._();

  static Future<void> lauchUrl(Url urlLink) async {
    Uri url = Uri(
      scheme: urlLink.scheme,
      host: urlLink.host,
      path: urlLink.path,
      query: urlLink.path,
    );
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
    )) {
      logger.e('error when launch $url');
    }
  }
}

class Url {
  final String scheme;
  final String host;
  String? path;

  Url({required this.scheme, required this.host, this.path});
}
