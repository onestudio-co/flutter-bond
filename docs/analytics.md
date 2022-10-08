# App Analytics:

### Create Event:
   Define youer event by create new class extending `AnalyticsEvent`, provide a `key` and a `params` of the event
```dart
class LoginEvent extends AnalyticsEvent {  
  final int userId;  
  final String channel;  
  
  LoginEvent({required this.userId, required this.channel});  
  
  @override  
  String get key => 'User Logged In';  
  
  @override  
  Map<String, dynamic> get params => {'channel': channel};  
}
```

### System Events:
if you believe this event is a system event (events are predefined in most analytics providers' tools)
you can mix your custom event with one of predefined system events
```dart
export 'system_events/user_added_to_cart.dart';  
export 'system_events/user_begin_checkout.dart';  
export 'system_events/user_begin_tutorial.dart';  
export 'system_events/user_complete_tutorial.dart';  
export 'system_events/user_logged_in.dart';  
export 'system_events/user_logged_out.dart';  
export 'system_events/user_made_purchase.dart';  
export 'system_events/user_signed_up.dart';  
export 'system_events/user_update_profile.dart';  
export 'system_events/user_viewed_item_list.dart';
```

The `LoginEvent`  is an system event predefined in most analytics providers' tools.
therefore we can use `User Logged In` mixin and provider a necessary implementation for this system event.

```dart
class LoginEvent extends AnalyticsEvent with UserLoggedIn {  
 final int userId;  
 final String channel;  
  
  LoginEvent({required this.userId, required this.channel});  
  
  @override  
  String get key => 'User Logged In';  
  
  @override  
  Map<String, dynamic> get params => {'channel': channel};  
  
  @override  
  int get id => userId!;  
  
  @override  
  String get loginMethod => channel!;  
}
```

this mixin will make it easy for any `AnalyticsProvider` to handle the event in the custom way or call the corresponding predefined method to log this event.
 
```dart
@override  
void log(AnalyticsEvent event) {
 if (event is UserLoggedIn) {  
   final UserLoggedIn userLoggedIn = event as UserLoggedIn;  
  _appsflyer.setCustomerUserId(userLoggedIn.id.toString());  
  _appsflyer.logEvent(event.key, event.params);  
  }
}
```

### Fire Event:
```dart
AppAnalytics.fire(LoginEvent(userId: user.id, channel: 'apple'));
  ```
  
### Custom App Analytics Provider:
Define youer customer by create new class extending `AnalyticsProvider` simple example:

```dart
class AppsflyerAnalyticsProvider implements AnalyticsProvider {  
  final AppsflyerSdk _appsflyer;  
  
  AppsflyerAnalyticsProvider(this._appsflyer);  
  
  @override  
  void log(AnalyticsEvent event) {
   if (event is UserLoggedIn) {  
      final UserLoggedIn userLoggedIn = event as UserLoggedIn;  
     _appsflyer.setCustomerUserId(userLoggedIn.id.toString());  
     _appsflyer.logEvent(event.key, event.params);  
  } else if (event is UserSignedUp) {  
      final UserSignedUp userSignedUp = event as UserSignedUp;  
     _appsflyer.setCustomerUserId(userSignedUp.id.toString());  
     _appsflyer.logEvent(event.key, event.params);  
  } else if (event is UserUpdateProfile) {  
      final UserUpdateProfile user = (event as UserUpdateProfile);  
      _appsflyer.setAdditionalData({  
      'email': user.email,  
      'dob': user.dob,  
      'gender': user.gender,  
      'country': user.email,  
      'city': user.email,  
      }..addAll(user.customAttributes));  
     _appsflyer.logEvent(event.key, event.params);  
  } else {  
     _appsflyer.logEvent(event.key, event.params);  
  }  
  }  
}
```
   and you need to add this custom provider to `analyticsProviders`  on `app.dart` file
```dart
final List<AnalyticsProvider> analyticsProviders = [  
  FirebaseAnalyticsProvider(FirebaseAnalytics.instance),  
  AppsflyerAnalyticsProvider(appsflyerSdk)  
];
```
