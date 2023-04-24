# Beacon: Notification Handling System

Beacon is a versatile and efficient notification handling system for both remote and local notifications in your application. It streamlines the process of managing notifications by providing a clear structure and customizable implementation. In this README, you will learn how to use Beacon in your project.

 
## Configuration

1.  Create a configuration file called `notification.dart` in your project's `lib/config/` directory.
2.  Add your notification providers and channels in the `NotificationConfig` class, as shown in the following example:

```dart
class NotificationConfig {
  static var providers = {
    'push_notification': {
      'driver': 'push_notification',
      'class': PushNotificationsProviders,
      'channels': [
        {
          'name': 'firebase_messaging',
          'class': FirebaseMessagingNotificationProvider,
        }
      ],
    },
    // Add more providers as needed.
  };
}
```

## Creating Notification Providers

1.  For each type of notification you want to handle, create a new class that extends `PushNotificationProvider` or `ServerNotificationProvider`.
2.  Implement the required methods for each notification provider, as shown in the following example:

```dart
class FirebaseMessagingNotificationProvider extends PushNotificationProvider {
  final FirebaseMessaging _firebaseMessaging;

  FirebaseMessagingNotificationProvider(this._firebaseMessaging);

  // Implement the required methods.
}
```

## Code-based Notification Handling

To allow Beacon to handle push notifications, each notification must have a key called "code". Beacon will search for a suitable `PushNotification` subclass that can handle this notification. The `PushNotification` subclass must define the code it can handle, the `onNotification` method, and, if the PushNotification is


## Registering PushNotifications

1.  In your feature service provider, register each push notification  by adding an entry in the `pushNotifications` list
2.   Here's an example of registering a PushNotification:
```dart
class OrderServiceProvider extends ServiceProvider
    with PushNotificationServiceProviderMixin {
  @override
  Future<void> register(GetIt it) async {
    // Register dependencies.
  }

  @override
  List<PushNotification> get pushNotifications => [
        OrderUpdatedPushNotifications(),
      ];
}
```

## Handling Notifications

create new file for push notifcation , implement the `onNotification` and `onNotificationTapped` methods to handle the desired actions when a notification is received or tapped.


```dart
class OrderUpdatedPushNotifications extends PushNotification
    with ActionablePushNotification {
  @override
  List<String> get code => ['order_placed', 'order_update_delivery_status'];

  @override
  void onNotification(NotificationData data) {
    // Handle notification received.
  }

  @override
  void onNotificationTapped(NotificationData data) {
    // Handle notification tapped.
  }
}
```

## Predefined Notification Providers

Beacon comes with predefined notification providers:

1.  FirebaseMessagingNotificationProvider: A push notifications provider using Firebase Cloud Messaging.
2.  NotificationCenterProvider: A server notification provider that stores and manages server-side notifications.
3.  (Optional) NotificationCenterPage: A UI component that reads and renders notifications from the NotificationCenterProvider. It also provides functionality like marking notifications as read.


## Custom Notification Providers

Beacon allows you to create custom notification providers, such as a OneSignal push notification provider. To create a custom provider, follow the steps in the "Creating Notification Providers" section.


## Future Developments

Beacon is still in beta version, and plans to handle the following features in future releases:

1.  Channel & Category Management
2.  Quick Actions
3.  Styled Notifications
4.  Trigger Notifications
