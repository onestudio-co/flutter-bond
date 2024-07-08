#!/bin/bash

# Description: This script configures Firebase for different environments using the FlutterFire CLI.

# VARIABLES TO BE MODIFIED

# Production Environment
PROJECT_ID_PRODUCTION="flutter-bond-87485"           # Firebase project ID for production
ANDROID_PACKAGE_NAME_PRODUCTION="ps.app.bond" # Android package name for production
IOS_BUNDLE_ID_PRODUCTION="ps.app.bond"        # iOS bundle ID for production
MACOS_BUNDLE_ID_PRODUCTION="ps.app.flutterBond" # macOS bundle ID for production
WEB_APP_ID_PRODUCTION="1:766000556009:web:2165a143cd98adf4d0cd78" # Web app ID for production

# Staging Environment
PROJECT_ID_STAGING="flutter-bond-staging"            # Firebase project ID for staging
ANDROID_PACKAGE_NAME_STAGING="ps.app.bond.staging" # Android package name for staging
IOS_BUNDLE_ID_STAGING="ps.app.bond.staging"  # iOS bundle ID for staging
MACOS_BUNDLE_ID_STAGING="ps.app.flutterBond.staging" # macOS bundle ID for staging
WEB_APP_ID_STAGING="1:1060161913171:web:68b14b55cce605b655a1a6" # Web app ID for staging

# Production Environment Configuration
flutterfire configure \
--yes \
--project=$PROJECT_ID_PRODUCTION \
--platforms=ios,macos,android,web \
--android-out=android/app/src/production/google-services.json \
--android-package-name=$ANDROID_PACKAGE_NAME_PRODUCTION \
--ios-build-config='Debug-Production' \
--ios-out=/ios/production/GoogleService-Info.plist \
--ios-bundle-id=$IOS_BUNDLE_ID_PRODUCTION \
--macos-build-config='Debug-Production' \
--macos-out=/macos/production/GoogleService-Info.plist \
--macos-bundle-id=$MACOS_BUNDLE_ID_PRODUCTION \
--web-app-id=$WEB_APP_ID_PRODUCTION \
--out=lib/firebase_options_production.dart

# Production Environment Release Configuration
flutterfire configure \
--yes \
--project=$PROJECT_ID_PRODUCTION \
--ios-build-config='Release-Production' \
--ios-out=/ios/production/GoogleService-Info.plist \
--ios-bundle-id=$IOS_BUNDLE_ID_PRODUCTION \
--macos-build-config='Release-Production' \
--macos-out=/macos/production/GoogleService-Info.plist \
--macos-bundle-id=$MACOS_BUNDLE_ID_PRODUCTION \
--out=lib/firebase_options_production.dart

# Staging Environment Configuration
flutterfire configure \
--yes \
--project=$PROJECT_ID_STAGING \
--platforms=ios,macos,android,web \
--android-out=android/app/src/staging/google-services.json \
--android-package-name=$ANDROID_PACKAGE_NAME_STAGING \
--ios-build-config='Debug-Staging' \
--ios-out=/ios/staging/GoogleService-Info.plist \
--ios-bundle-id=$IOS_BUNDLE_ID_STAGING \
--macos-build-config='Debug-Staging' \
--macos-out=/macos/staging/GoogleService-Info.plist \
--macos-bundle-id=$MACOS_BUNDLE_ID_STAGING \
--web-app-id=$WEB_APP_ID_STAGING \
--out=lib/firebase_options_staging.dart

# Staging Environment Release Configuration
flutterfire configure \
--yes \
--project=$PROJECT_ID_STAGING \
--platforms=ios,macos \
--ios-build-config='Release-Staging' \
--ios-out=/ios/staging/GoogleService-Info.plist \
--ios-bundle-id=$IOS_BUNDLE_ID_STAGING \
--macos-build-config='Release-Staging' \
--macos-out=/macos/staging/GoogleService-Info.plist \
--macos-bundle-id=$MACOS_BUNDLE_ID_STAGING \
--out=lib/firebase_options_staging.dart
