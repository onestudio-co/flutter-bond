[![Build](https://github.com/onestudio-co/flutter-bond/actions/workflows/build.yml/badge.svg)](https://github.com/onestudio-co/flutter-bond/actions/workflows/build.yml)

Flutter Bond is the public One Studio's template for all internal Flutter apps. You are welcome to use this template for your project as well and contribute to make it even better.

This is a Work In Progress mini framework inspired by Clean Architecture, lessons learned from past projects, and ideas from the Laravel ecosystem.

## Table of Contents

- [Introduction](#introduction)
- [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
    - [Running the Project](#running-the-project)
    - [Using FVM with Android Studio](#using-fvm-with-android-studio)
    - [Contributing Guidelines](#contributing-guidelines)
    - [Code Style](#code-style)
    - [Submitting a Pull Request](#submitting-a-pull-request)
- [Detailed Docs](#detailed-docs)
- [To Be Documented](#to-be-documented)

## Introduction

Flutter Bond is a Work In Progress mini framework inspired by Clean Architecture, lessons learned from past projects, and ideas from the Laravel ecosystem. This template aims to provide a solid foundation for building Flutter apps with a focus on maintainability, scalability, and best practices.

## Using FVM with Android Studio

To ensure that your project in Android Studio uses the Flutter version managed by FVM, follow these steps:

## Using FVM with Android Studio

To make Android Studio use the Flutter version managed by FVM for your project, follow these steps:

1. **Install FVM:**
   If you haven't already installed FVM globally, you need to install it using the terminal:

   \\\`\\\`\\\`bash
   pub global activate fvm

   # Install the Desired Flutter Version:
   # Use FVM to install the Flutter version you want to use for your project. For example:
   fvm install 3.10.0
   \\\`\\\`\\\`

2. **Configure Android Studio:**
   Open your Flutter Bond project in Android Studio and follow these steps:
    - Go to "File" > "Project Structure".
    - In the "Modules" section, find "Flutter" in the left sidebar and select it.
    - In the "Flutter SDK Version" dropdown, choose the version you installed using FVM (e.g., "3.10.0").

Now, Android Studio will use the Flutter version managed by FVM for your project.

## Getting Started

### Prerequisites

Before you begin, please make sure you have the following prerequisites installed:

- Flutter (Flutter version >= 3.10 recommended)
- Dart

### Installation

1. **Fork the Repository:** Click on the "Fork" button at the top right corner of the [Flutter Bond repository](https://github.com/onestudio-co/flutter-bond) to create your own fork.

2. **Clone Your Fork:** Clone your forked repository to your local machine:

   \\\`\\\`\\\`bash
   git clone https://github.com/your-username/FlutterBond.git
   \\\`\\\`\\\`

3. **Navigate to the Project Directory:** Move into the project directory:

   \\\`\\\`\\\`bash
   cd FlutterBond
   \\\`\\\`\\\`

4. **Install Dependencies:** Install the project's dependencies:

   \\\`\\\`\\\`bash
   flutter pub get
   \\\`\\\`\\\`

### Running the Project

Ensure you have a working emulator or physical device configured for Flutter development using Android Studio or Visual Studio Code with Flutter and Dart extensions.

1. **Launch the App:** Start the app on your device or emulator:

   \\\`\\\`\\\`bash
   flutter run
   \\\`\\\`\\\`

2. **Verify Installation:** If the app's welcome screen appears, the setup was successful.

## Detailed Docs

- [Flavors](https://github.com/onestudio-co/flutter-bond/blob/main/docs/flavors.md)
- [App Launcher](https://github.com/onestudio-co/flutter-bond/blob/main/docs/launcher.md)
- [Themes](https://github.com/onestudio-co/flutter-bond/blob/main/docs/themes.md)
- [Firebase Integration](https://github.com/onestudio-co/flutter-bond/blob/main/docs/firebase.md)
- [Analytics](https://github.com/onestudio-co/flutter-bond/blob/main/docs/analytics.md)
- Localization
- Futures samples
- [Change App Package Name](https://github.com/onestudio-co/flutter-bond/blob/main/docs/change_app_name.md)

## To Be Documented

- IoC & Service Provider
- Config
- Routing
    - Guards
- Rest API
    - Meta
    - Pagination
- Authentication
    - Customize user model
    - Device information
- App Bloc
- Cache
- Bond generator