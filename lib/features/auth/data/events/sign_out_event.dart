import 'package:one_studio_core/core.dart';

class SignOutEvent extends AnalyticsEvent with UserSignedOut {
  @override
  SystemEvents get systemEventType => SystemEvents.signedOut;

  @override
  String get key => 'User Signed out';

  @override
  Map<String, dynamic> get params => {};
}
