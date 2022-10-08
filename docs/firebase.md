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
