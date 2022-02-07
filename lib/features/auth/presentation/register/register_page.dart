import 'package:auto_route/auto_route.dart';
import 'package:fixit/routes/app_router.dart';
import 'package:fixit/core/assets.dart';
import 'package:fixit/core/constants.dart';
import 'package:fixit/core/extension.dart';
import 'package:fixit/core/fixit_alert.dart';
import 'package:fixit/core/widgets/app_bar.dart';
import 'package:fixit/core/widgets/fixit_button.dart';
import 'package:fixit/core/widgets/fixit_statusbar.dart';
import 'package:fixit/core/widgets/fixit_text_field.dart';
import 'package:fixit/features/auth/presentation/social_account_login/apple_id_login/apple_id_login_widget.dart';
import 'package:fixit/features/auth/presentation/social_account_login/google_account_login/google_account_login_widget.dart';
import 'package:fixit/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'register_cubit.dart';
import 'register_state.dart';

class RegistrationPage extends StatefulWidget implements AutoRouteWrapper {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider<RegisterCubit>(
      create: (ctx) => sl<RegisterCubit>(), child: this);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController name = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController referralCode = TextEditingController();
  late RegisterCubit registerCubit;
  bool sendButtonEnable = false;

  refreshSendButtonEnable(String txt) {
    setState(() {
      sendButtonEnable = mobile.text.isNotEmpty && password.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    registerCubit = BlocProvider.of<RegisterCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    registerCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FixitStatusBar(
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: listenerRegister,
        child: BlocBuilder<RegisterCubit, RegisterState>(
          builder: (BuildContext context, RegisterState state) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: getAppbar(context, Strings.newAccount),
              body: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          child: const Text(
                            'حساب جديد بإستخدام رقم الجوال',
                            style: TextStyle(
                              color: Constant.navyColorRegular,
                              fontSize: 12.0,
                              fontFamily: AppFontFamily.regular,
                            ),
                          ),
                          margin: const EdgeInsets.only(
                              left: 8, right: 16, top: 24, bottom: 8),
                        ),
                        FixitTextFieldWidget(
                          onChanged: refreshSendButtonEnable,
                          onActiveTyping: () {
                            registerCubit.hideError('mobile');
                          },
                          controller: mobile,
                          errorString: registerCubit.getError("mobile"),
                          label: Strings.mobileLabel,
                          svgIcon: "assets/images/mobile.svg",
                          type: FixitTextType.mobile,
                        ),
                        FixitTextFieldWidget(
                          onChanged: refreshSendButtonEnable,
                          onActiveTyping: () {
                            registerCubit.hideError('password');
                          },
                          controller: password,
                          errorString: registerCubit.getError("password"),
                          label: Strings.passwordLabel,
                          svgIcon: "assets/images/password_lock.svg",
                          type: FixitTextType.password,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 16, right: 16, top: 32),
                          child: SafeArea(
                            child: FixitButton(
                              enable: sendButtonEnable,
                              loading: state is RegisterLoading,
                              label: Strings.createAccount,
                              background: getCorrectColor(),
                              labelColor: Colors.white,
                              onTab: onSignUp,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 16, right: 16, top: 32, bottom: 32),
                              child: Row(
                                children: [
                                  const Expanded(
                                    child: Divider(
                                      thickness: 2,
                                      color: Constant.greyColorDark,
                                    ),
                                  ),
                                  Container(
                                    child: const Text(
                                      'أو انشاء حساب باستخدام',
                                      style: TextStyle(
                                        color: Constant.navyColorExtraDark,
                                        fontSize: 12.0,
                                        fontFamily: AppFontFamily.regular,
                                      ),
                                    ),
                                    margin: const EdgeInsets.only(
                                        left: 8, right: 8),
                                  ),
                                  const Expanded(
                                    child: Divider(
                                      thickness: 2,
                                      color: Constant.greyColorDark,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const AppleIDLoginWidget(),
                            const GoogleAccountLoginWidget(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void listenerRegister(context, state) {
    if (state is RegisterSuccess) {
      context.router.navigate(ActivationRoute(fromForget: false));
    }

    if (state is RegisterFailed) {
      if (BlocProvider.of<RegisterCubit>(context).error == null) {
        FixitAlert.showNotificationBottom(context,
            title: Strings.registrationErrorTitle, inLastBottom: false);
      }
    }
  }

  onSignUp() {
    appBloc.mobile = mobile.text.toString().cleanMobile();
    BlocProvider.of<RegisterCubit>(context).registerPressed(
      password: password.text.toString(),
      number: mobile.text.toString(),
      name: name.text,
      referralCode: referralCode.text.trim(),
    );
  }

  Color getCorrectColor() => Constant.violetColorDark;
}
