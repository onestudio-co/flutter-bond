
# App Analytics:

### Create Event:
   Define your event by create new class extending `AnalyticsEvent`, provide a `key` and a `params` of the event
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

### Set User ID:
```dart
AppAnalytics.setUserId(user.id);
  ```
  
### Set User Attributes:
```dart
AppAnalytics.setUserAttributes({'age': user.age});
  ```
  
    
### Fire Event:
```dart
AppAnalytics.fire(LoginEvent(userId: user.id, channel: 'apple'));
  ```
  
### Custom App Analytics Provider: (Depreacted)
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
   and you need to add this custom provider to `analyticsProviders`  on `app.dart` file (Depreacted)
```dart
final List<AnalyticsProvider> analyticsProviders = [  
  FirebaseAnalyticsProvider(FirebaseAnalytics.instance),  
  AppsflyerAnalyticsProvider(appsflyerSdk)  
];
```

### Debug your Events:

#### Firebase Analytics
 1. Enable firebase debug mode For iOS add ```-FIRDebugEnabled``` as a command line argument in Xcode
	 - select your schema then `edit schema`

		<img width="847" alt="Screen Shot 2022-12-08 at 1 27 02 PM" src="https://user-images.githubusercontent.com/17902030/206435478-c99de7ec-b248-4e81-91d9-ba362c913151.png">

	- Select `Run` tab from left side pange then select the second tap `Arguments` and add the `-FIRDebugEnabled` under the `Argument Passed On Launch` section

		<img width="966" alt="Screen Shot 2022-12-08 at 1 34 53 PM" src="https://user-images.githubusercontent.com/17902030/206437723-6c314a52-cd84-47f4-be6d-5cd0da19b22c.png">
      
 2. Enable firebase debug mode for Android by run this command
 
    `adb shell setprop debug.firebase.analytics.app PACKAGE_NAME`
    
 3. Open firebase console and go to Analytics -> Debug
 4. Select you device.

**Firebase Analytics Debug View**

  <img width="1592" alt="Screen Shot 2022-12-08 at 1 52 46 PM" src="https://user-images.githubusercontent.com/17902030/206441015-e9043168-3760-4efe-89ad-e656713cbf94.png">

** **Notes** 

 - On windows if adb command not worked you need to locate the adb location and run the command from adb location for example
	 - `C:\Users\hp\AppData\Local\Android\Sdk\platform-tools\adb.exe shell setprop debug.firebase.analytics.app PACKAGE_NAME`
 - You have to stop debug for Android and iOS device after finish your work
	 - for iOS remove `FIRDebugEnabled`  from your schema Argument.
	 - for Android use this command `adb shell setprop debug.firebase.analytics.app .none.`


	




