import 'package:fixit/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FixitStatusBar extends StatelessWidget {
  final Widget child;
  final Color? statusBarColor;
  final Brightness? brightness;

  const FixitStatusBar({
    Key? key,
    required this.child,
    this.statusBarColor,
    this.brightness,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constant.greyColorRegular,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: statusBarColor ??
              Constant.greyColorRegular, // transparent status bar
          systemNavigationBarColor: Colors.black, // navigation bar color
          statusBarIconBrightness:
              brightness ?? Brightness.dark, // status bar icons' color
          systemNavigationBarIconBrightness:
              Brightness.light, //navigation bar icons' color
        ),
        child: SafeArea(
          child: child,
        ),
      ),
    );
  }
}
