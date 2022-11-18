import 'package:one_studio_core/core.dart';

class SignInEvent extends AnalyticsEvent with UserSignedIn {
  final int userId;
  final String channel;

  SignInEvent({required this.userId, required this.channel});

  @override
  SystemEvents get systemEventType => SystemEvents.signedIn;

  @override
  String get key => 'User Sign In';

  @override
  Map<String, dynamic> get params => {'Channel': channel};

  @override
  int get id => userId;

  @override
  String get loginMethod => channel;
}
