import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:bond_core/core.dart';

class FirebaseMessagingNotificationProvider extends PushNotificationProvider {
  final FirebaseMessaging _firebaseMessaging;

  FirebaseMessagingNotificationProvider(this._firebaseMessaging);

  @override
  Future<NotificationData?> get initialNotification async =>
      (await _firebaseMessaging.getInitialMessage())?.data;

  @override
  Stream<NotificationData> get onPushNotification =>
      FirebaseMessaging.onMessage.map(
        (event) => event.data
          ..putIfAbsent('title', () => event.notification?.title)
          ..putIfAbsent('body', () => event.notification?.body)
          ..putIfAbsent('image', () => event.notification?.android?.imageUrl),
      );

  @override
  Stream<NotificationData> get onPushNotificationTapped =>
      FirebaseMessaging.onMessageOpenedApp.map(
        (event) => event.data,
      );

  @override
  Stream<String> get onTokenRefresh => _firebaseMessaging.onTokenRefresh;

  @override
  Future<String?> get token => _firebaseMessaging.getToken();

  @override
  Future<String?> get apnsToken => _firebaseMessaging.getAPNSToken();

  @override
  Future<void> deleteToken() => _firebaseMessaging.deleteToken();
}
