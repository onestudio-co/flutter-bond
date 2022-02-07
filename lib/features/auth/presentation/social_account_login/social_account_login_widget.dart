import 'package:fixit/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

abstract class SocialAccountLoginWidget extends StatelessWidget {
  const SocialAccountLoginWidget({Key? key}) : super(key: key);

  bool get visible;
  String get icon;
  String get title;
  Color get backgroundColor;
  Color get textColor;
  Function(BuildContext context) get onPressed;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            onPressed(context);
          },
          child: Container(
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                border: Border.all(color: const Color(0xffE6E6E6))),
            padding: const EdgeInsets.only(top: 12, bottom: 12),
            margin: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  icon,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 17.0,
                    fontFamily: AppFontFamily.regular,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
