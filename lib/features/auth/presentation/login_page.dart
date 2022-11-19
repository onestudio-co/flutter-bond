import 'package:bond/core/app_localizations.dart';
import 'package:bond/core/resources/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.localizations.login_page_title,
        ),
      ),
      body: FormBlocListener<LoginBloc, String, String>(
        onSuccess: (context, state) => _onSuccess(context),
        onFailure: (context, state) => _onFailure(context, state),
        child: SingleChildScrollView(
          child: AutofillGroup(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 64,
                    ),
                    SvgPicture.asset(
                      AppImagesAssets.logo,
                      width: 95,
                      height: 120,
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    TextFieldBlocBuilder(
                      textFieldBloc: _loginFormBloc.phoneTextField,
                      labelText: LocaleKeys.registerPhoneLabel.tr(),
                      keyboardType: TextInputType.phone,
                      suffixIcon: const QuotemMobileNumberWidget(),
                      onChanged: (_) => _refreshEnabledButton(_loginFormBloc),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFieldBlocBuilder(
                      textFieldBloc: _loginFormBloc.passwordTextField,
                      labelText: LocaleKeys.registerPasswordLabel.tr(),
                      keyboardType: TextInputType.name,
                      suffixButton: SuffixButton.obscureText,
                      onChanged: (_) => _refreshEnabledButton(_loginFormBloc),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      alignment: AlignmentDirectional.centerStart,
                      height: 56,
                      child: RichText(
                        strutStyle: StrutStyle.fromTextStyle(
                            Theme.of(context).textTheme.labelLarge!),
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: LocaleKeys.forgetPassword.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: QuotemColors.cetaceanBlue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => context.router
                                    .popAndPush(const ForgetPasswordRoute()),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    QuotemButtonWidget(
                        onPressed: _loginFormBloc.submit,
                        titleColor: QuotemColors.white,
                        loading: !_loginFormBloc.state.canSubmit,
                        enable: enableButton,
                        title: LocaleKeys.login.tr()),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 56,
                      child: RichText(
                        strutStyle: StrutStyle.fromTextStyle(
                            Theme.of(context).textTheme.labelLarge!),
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: LocaleKeys.loginHaveAccount.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: QuotemColors.cetaceanBlue),
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap =
                                    () => context.router.push(RegisterRoute()),
                              text: LocaleKeys.createAccount.tr(),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onFailure(BuildContext context, FormBlocFailure<String, String> state) {
    setState(() {
      enableButton = false;
    });
  }

  void _onSuccess(BuildContext context) {}

  void _refreshEnabledButton(LoginBloc _loginBloc) {}
}
