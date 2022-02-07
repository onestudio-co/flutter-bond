import 'package:fixit/core/assets.dart';
import 'package:fixit/core/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AcceptTermsAndPrivacy extends StatefulWidget {
  final Function(int) onChange;

  const AcceptTermsAndPrivacy({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  @override
  _AcceptTermsAndPrivacyState createState() => _AcceptTermsAndPrivacyState();
}

class _AcceptTermsAndPrivacyState extends State<AcceptTermsAndPrivacy> {
  int acceptTerms = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding:
              const EdgeInsets.only(right: 18, left: 25, bottom: 0, top: 1),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                child: InkWell(
                    onTap: onChange,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          acceptTerms == 1
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                          color: acceptTerms == 0
                              ? Constant.violetColorDark
                              : Constant.violetColorDark,
                          size: 26,
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    text: Strings.iAccept,
                    style: const TextStyle(
                      color: Constant.navyColorExtraDark,
                      fontSize: 15,
                      fontFamily: AppFontFamily.regular,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: Strings.termsAndConditions,
                        style: const TextStyle(
                          color: Constant.violetColorDark,
                          fontSize: 15,
                          fontFamily: AppFontFamily.medium,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = onTermsAndConditions,
                      ),
                      const TextSpan(text: " "),
                      TextSpan(
                          text: Strings.and,
                          style: const TextStyle(
                            color: Constant.navyColorExtraDark,
                            fontSize: 15,
                            fontFamily: AppFontFamily.regular,
                          )),
                      const TextSpan(text: " "),
                      TextSpan(
                        text: Strings.termOfUse,
                        style: const TextStyle(
                          color: Constant.violetColorDark,
                          decoration: TextDecoration.underline,
                          fontSize: 15,
                          fontFamily: AppFontFamily.medium,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = onTermOfUse,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        if (acceptTerms == 0)
          Container(
            padding: const EdgeInsets.only(right: 55, left: 25, top: 0),
            child: Text(Strings.iAcceptTermsErrors,
                style: const TextStyle(
                  color: Constant.redColorRegular,
                  fontSize: 12,
                  fontFamily: AppFontFamily.regular,
                )),
          ),
      ],
    );
  }

  onTermOfUse() {
    // AppRouter.navigator.pushNamed(
    //   AppRouter.webViewPage,
    //   arguments: WebViewPageArguments(
    //     title: Strings.termOfUse,
    //     url: Config.getTermOfUse(),
    //   ),
    // );
  }

  onTermsAndConditions() {
    // AppRouter.navigator.pushNamed(
    //   AppRouter.webViewPage,
    //   arguments: WebViewPageArguments(
    //     title: Strings.termsAndConditions,
    //     url: Config.getTermsAndConditions(),
    //   ),
    // );
  }

  onChange() {
    setState(() {
      if (acceptTerms == -1) {
        acceptTerms = 1;
      } else {
        acceptTerms = acceptTerms == 1 ? 0 : 1;
      }
    });

    return widget.onChange(acceptTerms);
  }
}
