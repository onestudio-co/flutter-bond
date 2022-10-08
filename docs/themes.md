# Themes

##  Custom Font:

For example, if we want to use **Tajawal** font on our app, we have to follow these steps

1- download font family from [google fonts](https://fonts.google.com/specimen/Tajawal) 

2- copy  font family files to `assets/font` directory

3- in `pubspec.yaml` file declare new font family below `font` key
```yaml
    fonts:  
      - family: Tajawal-Bold  
        fonts:  
          - asset: assets/fonts/Tajawal-Bold.ttf  
      - family: Tajawal-Medium  
        fonts:  
          - asset: assets/fonts/Tajawal-Medium.ttf  
      - family: Tajawal  
        fonts:  
          - asset: assets/fonts/Tajawal-Regular.ttf
```

you can detect the correct name of font `family` in mac os from font information  

<img width="314" alt="full name font" src="https://user-images.githubusercontent.com/17902030/192465328-533eb775-ea8d-4e6b-9108-f464a3f61595.png">


4- create `TajawalFontsFamily` class to declare the font family in dart
``` dart
class TajawalFontsFamily {  
  static const String bold = 'Tajawal-Bold';  
  
  static const String medium = 'Tajawal-Medium';  
  
  static const String regular = 'Tajawal';  
}
```


## Text Theme:

We can extract the text themes with the help of a UI/UX designer and declare them in dart.

for example, this code is the Rasel app text theme

``` dart
class RaselTextTheme extends TextTheme {  
  @override  
  TextStyle get displayLarge => const TextStyle(  
        fontSize: 18,  
        fontFamily: TajawalFontsFamily.bold,  
      );  
  
  @override  
  TextStyle get headlineLarge => const TextStyle(  
        fontSize: 16,  
        fontFamily: TajawalFontsFamily.bold,  
      );  
  
  @override  
  TextStyle get headlineMedium => const TextStyle(  
        fontSize: 16,  
        fontFamily: TajawalFontsFamily.medium,  
      );  
  
  @override  
  TextStyle get headlineSmall => const TextStyle(  
        fontSize: 16,  
        fontFamily: TajawalFontsFamily.regular,  
      );  
  
  @override  
  TextStyle get bodyLarge => const TextStyle(  
        fontSize: 14,  
        fontFamily: TajawalFontsFamily.bold,  
      );  
  
  @override  
  TextStyle get bodyMedium => const TextStyle(  
        fontSize: 14,  
        fontFamily: TajawalFontsFamily.medium,  
      );  
  
  @override  
  TextStyle? get bodySmall => const TextStyle(  
        fontSize: 14,  
        fontFamily: TajawalFontsFamily.regular,  
      );  
  
  @override  
  TextStyle get titleLarge => const TextStyle(  
        fontSize: 12,  
        fontFamily: TajawalFontsFamily.bold,  
      );  
  
  @override  
  TextStyle get titleMedium => const TextStyle(  
        fontSize: 12,  
        fontFamily: TajawalFontsFamily.medium,  
      );  
  
  @override  
  TextStyle get titleSmall => const TextStyle(  
        fontSize: 12,  
        fontFamily: TajawalFontsFamily.regular,  
      );  
  
  @override  
  TextStyle get labelLarge => const TextStyle(  
        fontSize: 10,  
        fontFamily: TajawalFontsFamily.bold,  
      );  
}
```
just replace the content of `core/resources/bond_text_theme.dart` file with the code above
and it's recommended to rename the file to `rasel_text_theme.dart` or wherever your app name is.


### Usage:

without a text theme, we need to declare your text style in a boring way like this


``` dart
 Text(
      widget.mainPrice,
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(
        fontSize: 16,
        fontFamily: TajawalFontsFamily.bold,
      ),
    );
```
this code is hard to write, read, or to refactoring

With text theme ✌️:

``` dart
Text(
      widget.strokedPrice,
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: context.textTheme.headlineLarge,
    );
```


### Text Style Color & Other properties

We still missing the text color and other text style properties 👎

We can simply create  `ColoredTextStyle` extension inside the `core/resources/bond_text_theme.dart` file

``` dart
extension ColoredTextStyle on TextStyle {
  TextStyle get accentColor => copyWith(color: MyTheme.accentColor);
}
```

How to use:
 
``` dart
Text(
      widget.mainPrice,
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: context.textTheme.headlineLarge?.accentColor,
    );
```


We can also add any other text style property to `TextStyle` extension  like decoration or letter Spacing .. etc

``` dart
extension DecorationTextStyle on TextStyle {
   TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);
   TextStyle get overline => copyWith(color: TextDecoration overline);
}
```

and use it with color extension or any other text style extension: 

``` dart
Text(
      widget.strokedPrice,
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: context.textTheme.headlineLarge?.accentColor
                                             .lineThrough
                                             .overline,
    );
```
