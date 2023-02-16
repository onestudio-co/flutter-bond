import 'package:auto_route/auto_route.dart';
import 'package:bond/core/app_localizations.dart';
import 'package:bond/routes/app_router.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:one_studio_core/core.dart';

class NewAccountView extends StatelessWidget {
  const NewAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 56,
      child: RichText(
        strutStyle: StrutStyle.fromTextStyle(
          context.textTheme.labelLarge!,
        ),
        text: TextSpan(
          children: [
            TextSpan(
              text: context.localizations.login_page_not_have_account,
              style: context.textTheme.bodySmall,
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () => context.router.push(const RegisterRoute()),
              text: context.localizations.login_page_new_account_button,
              style: context.textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
