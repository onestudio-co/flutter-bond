

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

# Futures samples:
  ## Auth Featuer
