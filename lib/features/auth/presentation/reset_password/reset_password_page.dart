import 'package:auto_route/auto_route.dart';
import 'package:fixit/core/assets.dart';
import 'package:fixit/core/constants.dart';
import 'package:fixit/core/fixit_alert.dart';
import 'package:fixit/core/widgets/fixit_button.dart';
import 'package:fixit/core/widgets/fixit_statusbar.dart';
import 'package:fixit/core/widgets/fixit_text_field.dart';
import 'package:fixit/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'reset_password_cubit.dart';
import 'reset_password_state.dart';

class ResetPasswordPage extends StatefulWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider<ResetPasswordCubit>(
      create: (ctx) => sl<ResetPasswordCubit>(), child: this);

  final String mobile, code;
  final Function onSuccess;

  const ResetPasswordPage(
      {Key? key,
      required this.mobile,
      required this.code,
      required this.onSuccess})
      : super(key: key);

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  late ResetPasswordCubit resetPasswordCubit;

  bool sendButtonEnable = false;

  refreshSendButtonEnable(String txt) {
    setState(() {
      sendButtonEnable = passwordController.text.isNotEmpty &&
          newPasswordController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    resetPasswordCubit = BlocProvider.of<ResetPasswordCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    resetPasswordCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FixitStatusBar(
      child: BlocListener<ResetPasswordCubit, ResetPasswordState>(
          listener: listenerRestPassword,
          child: BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
              builder: (BuildContext context, ResetPasswordState state) {
            return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  elevation: 0.0,
                  backgroundColor: Constant.greyColorRegular,
                  centerTitle: true,
                  title: Text(Strings.resetPassword,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontFamily: AppFontFamily.medium,
                      )),
                  leading: IconButton(
                    icon: SvgPicture.asset(Assets.close, color: Colors.black),
                    onPressed: () {
                      //AppRouter.navigator.pop();
                    },
                  ),
                ),
                body: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        FixitTextFieldWidget(
                          controller: passwordController,
                          errorString:
                              resetPasswordCubit.getError("new_password"),
                          label: Strings.newPasswordLabel,
                          svgIcon: "assets/images/password-type.svg",
                          type: FixitTextType.password,
                          onActiveTyping: () {
                            resetPasswordCubit.hideError('new_password');
                          },
                          onChanged: refreshSendButtonEnable,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FixitTextFieldWidget(
                          controller: newPasswordController,
                          errorString:
                              resetPasswordCubit.getError("c_password"),
                          label: Strings.confirmPasswordLabel,
                          svgIcon: "assets/images/password-type.svg",
                          onActiveTyping: () {
                            resetPasswordCubit.hideError('c_password');
                          },
                          type: FixitTextType.password,
                          onChanged: refreshSendButtonEnable,
                        ),
                      ],
                    ),
                    Positioned(
                        bottom: 20,
                        right: 20,
                        left: 20,
                        child: SafeArea(
                          child: FixitButton(
                            enable: sendButtonEnable,
                            loading: state is ResetPasswordLoading,
                            label: Strings.save,
                            background: Constant.violetColorDark,
                            labelColor: Colors.white,
                            onTab: onReset,
                          ),
                        ))
                  ],
                ));
          })),
    );
  }

  onReset() {
    BlocProvider.of<ResetPasswordCubit>(context).resetPasswordPressed(
        mobile: widget.mobile,
        newPassword: passwordController.text.toString(),
        confirmedPassword: newPasswordController.text.toString(),
        code: widget.code);
  }

  Future<void> listenerRestPassword(context, state) async {
    if (state is ResetPasswordSuccess) {
      await appBloc.clearAppData();
      widget.onSuccess();
    }

    if (state is ResetPasswordFailed) {
      if (BlocProvider.of<ResetPasswordCubit>(context).error == null) {
        FixitAlert.showNotificationBottom(context,
            title: state.error, inLastBottom: false);
      }
    }
  }
}
