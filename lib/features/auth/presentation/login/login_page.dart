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
import 'package:fixit/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../forget_password/forget_password_bottom_sheet.dart';
import '../social_account_login/apple_id_login/apple_id_login_widget.dart';
import '../social_account_login/google_account_login/google_account_login_widget.dart';
import 'login_cubit.dart';
import 'login_state.dart';

class LoginPage extends StatefulWidget implements AutoRouteWrapper {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<LoginCubit>(
            create: (ctx) => sl<LoginCubit>(),
          ),
        ],
        child: this,
      );

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();
  late LoginCubit loginCubit;
  bool sendButtonEnable = false;

  void refreshSendButtonEnable(String txt) {
    setState(() {
      sendButtonEnable = mobile.text.isNotEmpty && password.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    loginCubit = BlocProvider.of<LoginCubit>(context);
    mobile.text = appBloc.mobile ?? '';
    refreshSendButtonEnable("");

    super.initState();

    getSMSAutoFillSignature();
  }

  getSMSAutoFillSignature() async {
    // final signCode = await SmsAutoFill().getAppSignature;
    // print("SmsAutoFill signCode: $signCode");
  }

  @override
  void dispose() {
    mobile.dispose();
    password.dispose();
    loginCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FixitStatusBar(
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: loginListener,
        builder: (BuildContext context, LoginState state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: getAppbar(
              context,
              Strings.login,
              // hideBack: !AppRouter.navigator.canPop(),
            ),
            body: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        child: const Text(
                          'تسجيل الدخول بإستخدام رقم الجوال',
                          style: TextStyle(
                            color: Constant.navyColorRegular,
                            fontSize: 12.0,
                            fontFamily: AppFontFamily.regular,
                          ),
                        ),
                        margin: const EdgeInsets.only(
                            left: 8, right: 16, top: 24, bottom: 20),
                      ),
                      FixitTextFieldWidget(
                        controller: mobile,
                        errorString: loginCubit.getError('mobile'),
                        label: Strings.mobileLabel,
                        onActiveTyping: () {
                          loginCubit.hideError('mobile');
                        },
                        onChanged: refreshSendButtonEnable,
                        svgIcon: "assets/images/mobile.svg",
                        type: FixitTextType.mobile,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      FixitTextFieldWidget(
                        errorString: loginCubit.getError('password'),
                        controller: password,
                        label: Strings.passwordLabel,
                        onActiveTyping: () {
                          loginCubit.hideError('password');
                        },
                        onChanged: refreshSendButtonEnable,
                        svgIcon: "assets/images/password-type.svg",
                        type: FixitTextType.password,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  right: 10, left: 10, top: 10),
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SvgPicture.asset(
                                      "assets/images/arrow-circle-left.svg"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: showForgetPasswordBottomSheet,
                                      child: Text(
                                        Strings.forgetPasswordQuestion,
                                        overflow: TextOverflow.clip,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Constant.violetColorDark,
                                          fontFamily: AppFontFamily.regular,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(left: 16, right: 16, top: 32),
                        child: SafeArea(
                          child: FixitButton(
                            enable: sendButtonEnable,
                            loading: state is LoginLoading,
                            label: Strings.login,
                            background: Constant.violetColorDark,
                            labelColor: Colors.white,
                            onTab: onLogin,
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
                                  margin:
                                      const EdgeInsets.only(left: 8, right: 8),
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
    );
  }

  onRegister() {
    context.router.push(const RegistrationRoute());
  }

  onLogin() {
    loginCubit.loginPressed(
      mobile: mobile.text.toString(),
      password: password.text.toString(),
    );
  }

  void loginListener(BuildContext context, state) {
    if (state is LoginSuccess) {
      context.router.popAndPush(const HomeRoute());
    }

    if (state is LoginFailed) {
      // todo not verified returned in error?
      if (loginCubit.code == "not_verified") {
        appBloc.mobile = mobile.text.toString().cleanMobile();
        context.router.navigate(ActivationRoute(fromForget: false));
      }

      if (loginCubit.error == null) {
        debugPrint("state.code ${state.code}");
        FixitAlert.showNotificationBottom(context,
            title: "لا يمكنك تسجيل الدخول", inLastBottom: false);
      }
    }
  }

  showForgetPasswordBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (builder) {
        return const ForgetPasswordBottomSheet();
      },
    );
  }
}
