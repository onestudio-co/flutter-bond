# Change App Package Name
Change App Package Name with single command For Android

What It does?

- Update AndroidManifest.xml files for release, debug & profile.
- Update build.gradle file.
- Update MainActivity file. Both java & kotlin supported.
- Move MainActivity file to new package directory structure.
- Delete old package name directory structure.

How to Use?
- Run this command to change the package name .

  **Production**

  ``` flutter pub run change_app_package_name:main_production com.new.package.name ```

  **Staging**

  ``` flutter pub run change_app_package_name:main_staging com.new.package.name ```

Where com.new.package.name is the new package name that you want for your app. replace it with any name you want.