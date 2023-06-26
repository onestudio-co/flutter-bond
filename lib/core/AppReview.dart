import 'package:in_app_review/in_app_review.dart';

class AppReviewHelper {
  static void showAppReview() async {
    await InAppReview.instance.isAvailable();
    InAppReview.instance.requestReview();
  }
}