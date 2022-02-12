import 'package:auto_route/auto_route.dart';
import 'package:fixit/core/assets.dart';
import 'package:fixit/core/constants.dart';
import 'package:fixit/core/extension.dart';
import 'package:fixit/core/fixit_alert.dart';
import 'package:fixit/core/theme/fixit_text_theme.dart';
import 'package:fixit/core/widgets/app_bar.dart';
import 'package:fixit/core/widgets/fixit_button.dart';
import 'package:fixit/core/widgets/fixit_statusbar.dart';
import 'package:fixit/core/widgets/fixit_text_field.dart';
import 'package:fixit/injection_container.dart';
import 'package:fixit/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../forget_password/forget_password_bottom_sheet.dart';
import '../social_account_login/apple_id_login/apple_id_login_widget.dart';
import '../social_account_login/google_account_login/google_account_login_widget.dart';
import 'login_cubit.dart';
import 'login_state.dart';

class LoginPage extends StatelessWidget implements AutoRouteWrapper {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider<LoginCubit>(
        create: (BuildContext context) => sl<LoginCubit>(),
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: _loginListener,
      child: FixitStatusBar(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: getAppbar(context, Strings.login),
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'تسجيل الدخول بإستخدام رقم الجوال',
                        style: Theme.of(context).textTheme.caption?.regularNavy,
                      ),
                      margin: const EdgeInsets.only(
                          left: 8, right: 16, top: 24, bottom: 20),
                    ),
                    _MobileInput(),
                    const SizedBox(height: 8),
                    _PasswordInput(),
                    const _ForgetPasswordWidget(),
                    _LoginButton(),
                    const _LoginFooter(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _loginListener(BuildContext context, LoginState state) {
    debugPrint('_loginListener ${state.toString()}');
    switch (state.status.formStatus) {
      case FormStatus.success:
        sl<AppRouter>().pop<bool>(true);
        break;
      case FormStatus.failed:
        if (state.status.notVerified) {
          appBloc.mobile = state.mobile.value.cleanMobile();
          context.router.navigate(ActivationRoute(fromForget: false));
        } else {
          FixitAlert.showNotificationBottom(context,
              title: "لا يمكنك تسجيل الدخول", inLastBottom: false);
        }
        break;
      default:
        break;
    }
  }
}

class _MobileInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.mobile != current.mobile,
      builder: (context, state) {
        return FixitTextFieldWidget(
          key: const Key('loginForm_mobileInput_textField'),
          label: Strings.mobileLabel,
          errorString: state.mobile.error,
          onChanged: (String mobile) =>
              context.read<LoginCubit>().loginMobileChanged(mobile),
          svgIcon: "assets/images/mobile.svg",
          type: FixitTextType.mobile,
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.mobile != current.mobile,
      builder: (context, state) {
        return FixitTextFieldWidget(
          key: const Key('loginForm_passwordInput_textField'),
          errorString: state.password.error,
          label: Strings.passwordLabel,
          onChanged: (String mobile) =>
              context.read<LoginCubit>().loginPasswordChanged(mobile),
          svgIcon: "assets/images/password-type.svg",
          type: FixitTextType.password,
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.status.formStatus != current.status.formStatus,
      builder: (context, state) {
        return Container(
          key: const Key('loginForm_loginButton'),
          margin: const EdgeInsets.only(left: 16, right: 16, top: 32),
          child: SafeArea(
            child: FixitButton(
              enable: state.status.formStatus == FormStatus.valid,
              loading: state.status.formStatus == FormStatus.inProgress,
              label: Strings.login,
              background: Constant.violetColorDark,
              labelColor: Colors.white,
              onTab: context.read<LoginCubit>().loginSubmitted,
            ),
          ),
        );
      },
    );
  }
}

class _ForgetPasswordWidget extends StatelessWidget {
  const _ForgetPasswordWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 10, left: 10, top: 10),
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  width: 10,
                ),
                SvgPicture.asset("assets/images/arrow-circle-left.svg"),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () => _showForgetPasswordBottomSheet(context),
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
    );
  }

  _showForgetPasswordBottomSheet(BuildContext context) {
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

class _LoginFooter extends StatelessWidget {
  const _LoginFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 32),
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
                margin: const EdgeInsets.only(left: 8, right: 8),
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
    );
  }
}
