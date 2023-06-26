import 'package:in_app_review/in_app_review.dart';

class AppReviewHelper {
  static Future<bool> showAppReview() async {
    bool isAvailable = await InAppReview.instance.isAvailable();
    if (isAvailable) {
      await InAppReview.instance.requestReview();
      return true;
    } else {
      return false;
    }
  }
}
