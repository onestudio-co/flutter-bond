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
