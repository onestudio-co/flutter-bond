import 'package:bond_app_analytics/bond_app_analytics.dart';

class SignUpEvent extends AnalyticsEvent with UserSignedUp {
  final int userId;
  final String channel;

  SignUpEvent({required this.userId, required this.channel});

  @override
  SystemEvents get systemEventType => SystemEvents.signedUp;

  @override
  String get key => 'User Signed Up';

  @override
  Map<String, dynamic> get params => {'Channel': channel};

  @override
  int get id => userId;

  @override
  String get signupMethod => channel;
}
