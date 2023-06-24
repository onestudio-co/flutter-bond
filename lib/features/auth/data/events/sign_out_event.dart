import 'package:bond_app_analytics/bond_app_analytics.dart';

class SignOutEvent extends AnalyticsEvent with UserSignedOut {
  @override
  SystemEvents get systemEventType => SystemEvents.signedOut;

  @override
  String get key => 'User Signed out';

  @override
  Map<String, dynamic> get params => {};
}
