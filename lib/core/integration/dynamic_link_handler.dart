abstract class DynamicLinkHandler {
  bool canHandle(Uri deepLink);

  Future<void> handle(Uri deepLink);
}
