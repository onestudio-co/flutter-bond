

# Bond

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Flavors
  This template support two flavors (production & staging)

- you can run the app directly from terminal using this command line:

  ``` flutter run --flavor production ```
  
  or for staging

  ``` flutter run --flavor staging ```

     
 - or you need to add new flutter configration for each flavor  (staging and production)
  
**Production**

<img width="722" alt="image" src="https://user-images.githubusercontent.com/17902030/189459865-61fa7694-c412-4a76-bdce-2024ecce07c8.png">

**Staging**

<img width="717" alt="image" src="https://user-images.githubusercontent.com/17902030/189459844-94a9bcfe-61dd-4df7-81b2-8915ee09c72f.png">

# App Launcher Icon

  We use [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) package to generate app icons for both   platforms android and ios.
  
 ### Update app icons
   1-  replace ```assets/icons/app-icon.png``` and ```assets/icons/app-icon-staging.png``` with the new app icons for both flavors.

   2- run this command to generate production flavor icons
   
    flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons.yaml

   3- run this command to generate production flavor icons
   
    flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons-staging.yaml
      
   4- run the app to make sure the launcher icon are updated correctly 
	   (**you need to stop it first hot restart not enough**). 

   5- commit changes.
   
   # App Splash Screen

 We use [flutter_native_splash](https://pub.dev/packages/flutter_native_splash) package to generate native splash screen images and files configrations for both platforms android and ios.
  
 ### Update native splash screen
   1-  replace ```assets/images/splash-logo.png``` and ```assets/icons/splash-logo-staging.png``` with the new app logo for both flavors.
   
   2-  update color proprety on  ```flutter_native_splash-production.yaml``` and ```flutter_native_splash-staging.yaml``` files with the new app splash background color for both flavors.

   2- run this command to generate production flavor native splash screen proprties
   
    flutter pub run flutter_native_splash:create --flavor production

   3- run this command to generate staging flavor native splash screen proprties
   
    flutter pub run flutter_native_splash:create --flavor staging
      
   4- run the app to make sure the native splash screen are updated correctly 
	   (**you need to stop it first hot restart will not enough**).

   5- commit changes.
      
# Enviroment Properties

# Localization

# Themes

##  Custom Font:

For example, if we want to use **Tajawal** font on our app, we have to follow these steps

1- download font family from [google fonts](https://fonts.google.com/specimen/Tajawal) 

2- copy  font family files to `assets/font` directory

3- in `pubspec.yaml` file declare new font family below `font` key
```yaml
    fonts:  
      - family: Tajawal-Bold  
        fonts:  
          - asset: assets/fonts/Tajawal-Bold.ttf  
      - family: Tajawal-Medium  
        fonts:  
          - asset: assets/fonts/Tajawal-Medium.ttf  
      - family: Tajawal  
        fonts:  
          - asset: assets/fonts/Tajawal-Regular.ttf
```

you can detect the correct name of font `family` in mac os from font information  

<img width="314" alt="full name font" src="https://user-images.githubusercontent.com/17902030/192465328-533eb775-ea8d-4e6b-9108-f464a3f61595.png">


4- create `TajawalFontsFamily` class to declare the font family in dart
``` dart
class TajawalFontsFamily {  
  static const String bold = 'Tajawal-Bold';  
  
  static const String medium = 'Tajawal-Medium';  
  
  static const String regular = 'Tajawal';  
}
```


## Text Theme:

We can extract the text themes with the help of a UI/UX designer and declare them in dart.

for example, this code is the Rasel app text theme

``` dart
class RaselTextTheme extends TextTheme {  
  @override  
  TextStyle get displayLarge => const TextStyle(  
        fontSize: 18,  
        fontFamily: TajawalFontsFamily.bold,  
      );  
  
  @override  
  TextStyle get headlineLarge => const TextStyle(  
        fontSize: 16,  
        fontFamily: TajawalFontsFamily.bold,  
      );  
  
  @override  
  TextStyle get headlineMedium => const TextStyle(  
        fontSize: 16,  
        fontFamily: TajawalFontsFamily.medium,  
      );  
  
  @override  
  TextStyle get headlineSmall => const TextStyle(  
        fontSize: 16,  
        fontFamily: TajawalFontsFamily.regular,  
      );  
  
  @override  
  TextStyle get bodyLarge => const TextStyle(  
        fontSize: 14,  
        fontFamily: TajawalFontsFamily.bold,  
      );  
  
  @override  
  TextStyle get bodyMedium => const TextStyle(  
        fontSize: 14,  
        fontFamily: TajawalFontsFamily.medium,  
      );  
  
  @override  
  TextStyle? get bodySmall => const TextStyle(  
        fontSize: 14,  
        fontFamily: TajawalFontsFamily.regular,  
      );  
  
  @override  
  TextStyle get titleLarge => const TextStyle(  
        fontSize: 12,  
        fontFamily: TajawalFontsFamily.bold,  
      );  
  
  @override  
  TextStyle get titleMedium => const TextStyle(  
        fontSize: 12,  
        fontFamily: TajawalFontsFamily.medium,  
      );  
  
  @override  
  TextStyle get titleSmall => const TextStyle(  
        fontSize: 12,  
        fontFamily: TajawalFontsFamily.regular,  
      );  
  
  @override  
  TextStyle get labelLarge => const TextStyle(  
        fontSize: 10,  
        fontFamily: TajawalFontsFamily.bold,  
      );  
}
```
just replace the content of `core/resources/bond_text_theme.dart` file with the code above
and it's recommended to rename the file to `rasel_text_theme.dart` or wherever your app name is.


### Usage:

without a text theme, we need to declare your text style in a boring way like this


``` dart
 Text(
      widget.mainPrice,
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(
        fontSize: 16,
        fontFamily: TajawalFontsFamily.bold,
      ),
    );
```
this code is hard to write, read, or to refactoring

With text theme ✌️:

``` dart
Text(
      widget.strokedPrice,
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: context.textTheme.headlineLarge,
    );
```


### Text Style Color & Other properties

We still missing the text color and other text style properties 👎

We can simply create  `ColoredTextStyle` extension inside the `core/resources/bond_text_theme.dart` file

``` dart
extension ColoredTextStyle on TextStyle {
  TextStyle get accentColor => copyWith(color: MyTheme.accentColor);
}
```

How to use:
 
``` dart
Text(
      widget.mainPrice,
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: context.textTheme.headlineLarge?.accentColor,
    );
```


We can also add any other text style property to `TextStyle` extension  like decoration or letter Spacing .. etc

``` dart
extension DecorationTextStyle on TextStyle {
   TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);
   TextStyle get overline => copyWith(color: TextDecoration overline);
}
```

and use it with color extension or any other text style extension: 

``` dart
Text(
      widget.strokedPrice,
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: context.textTheme.headlineLarge?.accentColor
                                             .lineThrough
                                             .overline,
    );
```


# Firebase Integration

  We use [flutterfire](https://github.com/firebase/flutterfire) plugins to integrate app with firebase services, a long with [flutterfire cli](https://github.com/invertase/flutterfire_cli) to generate all firbase files and configurations for both platform android and ios.
  
  [flutterfire cli](https://github.com/invertase/flutterfire_cli) depends on [firebase cli](https://firebase.google.com/docs/cli) tool so we need to install flutter cli first.
  
  ###  Install and activate firebase cli (if not installed):
  
   1- for mac or linux you can simply run this command from terminal 
    
    curl -sL https://firebase.tools | bash
       
   2- for windows check [firebase cli docs](https://firebase.google.com/docs/cli#windows-npm) 🌚
    
   3- login to your firebase account using this commnd 
    
    firebase login
        
   (This command connects your local machine to Firebase and grants you access to your Firebase projects.)
        
  ### Flutterfire configure:
        
   1-  install flutterfire cli.

    dart pub global activate flutterfire_flavor_cli
		        
   2- run flutterfire configure command from you project path and follow up the commnd options.
      
    flutterfire configure
                   
   3- add [firebase_core](https://pub.dev/packages/firebase_core) plugin to the project .
   
    flutter pub add firebase_core
            
   4- on ```main_production.dart``` file intizalize firebase app.
           
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
            
  and make sure you import ```firebase_options_production.dart``` file.
          
  5- on ```main_staging.dart``` file intizalize firebase app
            
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
      
   and make sure you import ```firebase_options_staging.dart``` file.
    
   6- run project and make sure every thing work prefectly.
      
   7- commits changes.

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
# Futures samples:
  ## Auth Featuer

