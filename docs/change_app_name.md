# Update App Name & Package ID

To rename this app from flutter bond to `Jalsa` app for example

 1. install this package  [Rename](https://pub.dev/packages/rename)

	```
	flutter pub global activate rename
	```

 2. run this command to update `packageId` for  Android and `bundleId` for iOS

	```
	rename --bundleId sa.app.jalsa
	```

 3. run this command to update app name for android app

	```
	rename --appname "Jalsa"
	```

 4.  we need manually to update `bundleId` and `app name` for ios only, in xcode for each build configuration.
	   1. `open ios/Runner.xcworkspace`
	   2. select Runner target
	   3. select build settings tab
	   4. search for `PRODUCT_BUNDLE_IDENTIFIER` and update it for each build configuration.

5. open `android/app/src/debug/AndroidManifest.xml` and update package element
6. open `android/app/src/main/AndroidManifest.xml` and update package element
7. open `android/app/src/profile/AndroidManifest.xml` and update package element
8. rename `android/main/kotlin/com/example/bond` directory  to `android/main/kotlin/sa/app/jalsa`
8. open `pubspec.yaml`  update name & description

	```yaml
	name: jalsa 
	description: Jalsa Based Project.
	```

9. find and replace all `package:bond` to `package:jalsa`
 

 **Final result for product bundle identifier**

|Configuration | PRODUCT_BUNDLE_IDENTIFIER |
|--|--|
| Debug-production | sa.app.jalsa |
| Debug-staging | sa.app.jalsa.staging |
|  Release-production | sa.app.jalsa |
|  Release-staging | sa.app.jalsa.staging |

