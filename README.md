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

     
  - or you need to add new flutter configration for each flavor (staging and production)

<img width="867" alt="Screen Shot 2022-02-25 at 9 50 20 PM" src="https://user-images.githubusercontent.com/17902030/155785582-02200405-4f6e-4052-b334-22dc1eb557f7.png">
<img width="862" alt="Screen Shot 2022-02-25 at 9 52 29 PM" src="https://user-images.githubusercontent.com/17902030/155785851-31f0fdef-b71b-48e9-84c4-a8414317739d.png">

<img width="853" alt="Screen Shot 2022-02-25 at 9 52 46 PM" src="https://user-images.githubusercontent.com/17902030/155785867-58115332-8eda-4c24-99a9-f7ac8c0d0c9c.png">

# App Launcher Icon

 We use [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) package to generate app icons for both platforms android and ios.
 
There are to file to manage launcher icon proprties:

 1 - ``` flutter_launcher_icons.yaml ```  for production flavor icon.
 
 2 - ``` flutter_native_splash-staging.yaml ``` for staging flavor icons.
 
 ## update app icons
   1 - first replace ```assets/icons/app-icon.png``` and ```assets/icons/app-icon-staging.png``` with the new app icons for both flavors.

   2 - run this command to generate production flavor icons
   
      flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons.yaml

   3 - run this command to generate production flavor icons
   
      flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons-staging.yaml
      
   4 - run the app to make sure the launcher icon are updated correctly (*uninstall the app first). 

   5- commit changes.
   
   # App Splash Screen

 We use [flutter_native_splash](https://pub.dev/packages/flutter_native_splash) package to generate native splash screen images and files configrations for both platforms android and ios.
 
There are to file to manage native splash screen proprties:

 1 - ``` flutter_native_splash-production.yaml ``` for production flavor splash splash screen proprteis.
 
 2 - ``` flutter_native_splash-staging.yaml ``` for staging flavor splash screen proprteis.
 
 ## update native splash screen
   1 - first update ```flutter_native_splash-production.yaml``` and ```flutter_native_splash-staging.yaml``` with the new app native splash page proprties for both flavors.

   2 - run this command to generate production flavor native splash screen proprties
   
      flutter pub run flutter_native_splash:create --flavor production

   3 - run this command to generate staging flavor native splash screen proprties
   
      flutter pub run flutter_native_splash:create --flavor staging
      
   4 - run the app to make sure the native splash screen are updated correctly (*uninstall the app first). 

   5- commit changes.
      
# Enviroment Properties

# Localization

# Themes

# Firebase Integration

  We use [flutterfire](https://github.com/firebase/flutterfire) plugin to integrate app with firebase services,
  a long with [flutterfire cli](https://github.com/invertase/flutterfire_cli) to generate all firbase 
  files and configurations for both platform android and ios.
  
  [flutterfire cli](https://github.com/invertase/flutterfire_cli) depends on [firebase cli](https://firebase.google.com/docs/cli) tool
  so we need to install flutter cli first.
  
  ## install and activate firebase cli (if not installed):
  
   1 - for mac or linux you can simply run this command from terminal 
    
      curl -sL https://firebase.tools | bash
       
   2 - for windows check [firebase cli docs](https://firebase.google.com/docs/cli#windows-npm) 🌚
    
   3 - login to your firebase account using this commnd 
    
      firebase login
        
   (This command connects your local machine to Firebase and grants you access to your Firebase projects.)
        
  ## Flutterfire configure:
  
   because our app support multiple flavor (production & staging) we will use [forked version from flutterfire cli](https://github.com/salahamassi/flutterfire_cli/tree/support-flavors) 
      
   1 - clone this [fork from flutterfire cli](https://github.com/salahamassi/flutterfire_cli/tree/support-flavors).
      
   2 - run plugin from app path using this command from terminal (replace {path} with path to flutterfire cli directory)
   
      dart run {path}/flutterfire_cli/packages/flutterfire_cli/bin/flutterfire.dart configure
         
   3 - when this message appear in you terminal
      
      ? Do you want  to create a firebase project for each flavor? (y/n) › no       
          
   select ```y``` 
      ? Select a Firebase project to configure your Flutter application with, for production ›                              
          
   5 - flutterfire_cli will genrate two files on flutter project ```firebase_options_production.dart``` and ```firebase_options_staging.dart```
          
   on ```main_production.dart``` file intizalize firebase app 
            
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
            
   and make sure you import ```firebase_options_production.dart``` file
    
       
   on ```main_staging.dart``` file intizalize firebase app
            
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
      
      
   6 - add [firebase_core](https://pub.dev/packages/firebase_core) plugin to the project 
   
      flutter pub add firebase_core
      
            
   and make sure you import ```firebase_options_staging.dart``` file
    
   7 - run project and make sure every thing work prefectly.
      
   8 - commits changes.


# Futures samples:
  ## Auth Featuer

