#!/bin/bash

# Description: This script configures Firebase for different environments using the FlutterFire CLI.

# Function to configure Firebase
configure_firebase() {
    local PROJECT_ID=$1
    local ANDROID_PACKAGE_NAME=$2
    local IOS_BUNDLE_ID=$3
    local MACOS_BUNDLE_ID=$4
    local ENV=$5
    local IOS_BUILD_CONFIG=$6
    local MACOS_BUILD_CONFIG=$7
    local OUT_FILE=$8

    if [ -z "$PROJECT_ID" ]; then
        echo "No PROJECT_ID provided for ${ENV} environment. Creating a new Firebase project..."
        PROJECT_NAME="flutter-bond-${ENV}-$(date +%s)"
        firebase projects:create $PROJECT_NAME --display-name "$PROJECT_NAME"
        PROJECT_ID=$(firebase projects:list --filter="$PROJECT_NAME" --format="value(projectId)")
        echo "Created new Firebase project with ID: $PROJECT_ID"
    fi

    echo "Configuring Firebase for ${ENV} environment with project ID $PROJECT_ID..."
    flutterfire configure \
    --yes \
    --project=$PROJECT_ID \
    --platforms=ios,macos,android \
    --android-out=android/app/src/${ENV}/google-services.json \
    --android-package-name=$ANDROID_PACKAGE_NAME \
    --ios-build-config=$IOS_BUILD_CONFIG \
    --ios-out=ios/${ENV}/GoogleService-Info.plist \
    --ios-bundle-id=$IOS_BUNDLE_ID \
    --macos-build-config=$MACOS_BUILD_CONFIG \
    --macos-out=macos/${ENV}/GoogleService-Info.plist \
    --macos-bundle-id=$MACOS_BUNDLE_ID \
    --out=lib/firebase_options_${ENV}.dart

    if [ $? -ne 0 ]; then
        echo "Error configuring Firebase for ${ENV} environment."
        exit 1
    else
        echo "Successfully configured Firebase for ${ENV} environment."
    fi
}

# Production Environment
PROJECT_ID_PRODUCTION="flutter-bond-8ae02"
ANDROID_PACKAGE_NAME_PRODUCTION="ps.app.bond"
IOS_BUNDLE_ID_PRODUCTION="ps.app.bond"
MACOS_BUNDLE_ID_PRODUCTION="ps.app.flutterBond"

# Staging Environment
PROJECT_ID_STAGING="flutter-bond-staging-7dd42"
ANDROID_PACKAGE_NAME_STAGING="ps.app.bond.staging"
IOS_BUNDLE_ID_STAGING="ps.app.bond.staging"
MACOS_BUNDLE_ID_STAGING="ps.app.flutterBond.staging"

# Configure Production Environment
configure_firebase $PROJECT_ID_PRODUCTION $ANDROID_PACKAGE_NAME_PRODUCTION $IOS_BUNDLE_ID_PRODUCTION $MACOS_BUNDLE_ID_PRODUCTION "production" "Debug-Production" "Debug-Production" "firebase_options_production.dart"
configure_firebase $PROJECT_ID_PRODUCTION $ANDROID_PACKAGE_NAME_PRODUCTION $IOS_BUNDLE_ID_PRODUCTION $MACOS_BUNDLE_ID_PRODUCTION "production" "Release-Production" "Release-Production" "firebase_options_production.dart"

# Configure Staging Environment
configure_firebase $PROJECT_ID_STAGING $ANDROID_PACKAGE_NAME_STAGING $IOS_BUNDLE_ID_STAGING $MACOS_BUNDLE_ID_STAGING "staging" "Debug-Staging" "Debug-Staging" "firebase_options_staging.dart"
configure_firebase $PROJECT_ID_STAGING $ANDROID_PACKAGE_NAME_STAGING $IOS_BUNDLE_ID_STAGING $MACOS_BUNDLE_ID_STAGING "staging" "Release-Staging" "Release-Staging" "firebase_options_staging.dart"