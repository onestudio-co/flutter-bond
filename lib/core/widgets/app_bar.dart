import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

AppBar getAppbar(BuildContext context, String title,
    [bool hideBack = false, Function()? onBack, Color? background, icon]) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: background ?? Constant.greyColorRegular,
    centerTitle: true,
    title: Container(
      child: Text(
        title,
        style: const TextStyle(
          color: Constant.navyColorExtraDark,
          fontSize: 17,
          fontFamily: AppFontFamily.medium,
        ),
      ),
      margin: const EdgeInsets.only(bottom: 10),
    ),
    leading: hideBack == true
        ? const SizedBox(
            width: 10,
          )
        : Container(
            child: IconButton(
              icon: SvgPicture.asset(icon ?? "assets/images/back_btn.svg",
                  semanticsLabel: 'A red up arrow'),
              onPressed: () {
                if (onBack == null) {
                  // AppRouter.navigator.pop();
                } else {
                  onBack();
                }
              },
            ),
            margin: const EdgeInsets.only(bottom: 10),
          ),
  );
}
