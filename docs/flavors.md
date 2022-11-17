

# Rename app

To rename this app from flutter bond to `Jalsa` app for example

1. install this package  [Rename](https://pub.dev/packages/rename)
   `flutter pub global activate rename`
2. run this command to update `packageId` for  Android and `bundleId` for iOS
   `rename --bundleId sa.app.jalsa`
3. run this command to update app name for android app
   `rename --appName "Jalsa"`
4.  we need manually to update `bundleId` and `app name` for ios only, in xcode for each build configuration
   1. `open ios/Runner.xcworkspace`
   2. select Runner target
   3. select build settings tab
   4. search for `PRODUCT_NAME` and update it for each build configuration
   5. search for `PRODUCT_BUNDLE_IDENTIFIER` and update it for each build configuration.

 **Final result for product bundle identifier**

|Configuration | PRODUCT_BUNDLE_IDENTIFIER |
|--|--|
| Debug-production | sa.app.jalsa |
| Debug-staging | sa.app.jalsa.staging |
|  Release-production | sa.app.jalsa |
|  Release-staging | sa.app.jalsa.staging |

## Flavors
  This template support two flavors (production & staging)

- you can run the app directly from terminal using this command line:

  ```  flutter run --flavor production -t lib/main_production.dart ```
  
  or for staging

  ```  flutter run --flavor staging -t lib/main_staging.dart ```

     
 - or you need to add new flutter configration for each flavor  (staging and production)
  
**Production**

<img width="722" alt="image" src="https://user-images.githubusercontent.com/17902030/189459865-61fa7694-c412-4a76-bdce-2024ecce07c8.png">

**Staging**

<img width="717" alt="image" src="https://user-images.githubusercontent.com/17902030/189459844-94a9bcfe-61dd-4df7-81b2-8915ee09c72f.png">

