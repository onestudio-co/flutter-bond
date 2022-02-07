import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:fixit/core/assets.dart';
import 'package:fixit/core/constants.dart';
import 'package:fixit/core/widgets/count_down_timer.dart';
import 'package:fixit/core/widgets/fixit_button.dart';
import 'package:fixit/core/widgets/fixit_code_text_field.dart';
import 'package:fixit/core/widgets/fixit_statusbar.dart';
import 'package:fixit/core/widgets/fixit_text_field.dart';
import 'package:fixit/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sms_autofill/sms_autofill.dart';

import 'activation_cubit.dart';
import 'activation_state.dart';

class ActivationPage extends StatefulWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider<ActivationCubit>(
      create: (ctx) => sl<ActivationCubit>(), child: this);

  final bool fromForget;

  const ActivationPage({
    this.fromForget = false,
    Key? key,
  }) : super(key: key);

  @override
  _ActivationPageState createState() => _ActivationPageState();
}

class _ActivationPageState extends State<ActivationPage> {
  static const waitingTime = 61;
  TextEditingController code = TextEditingController();
  late ActivationCubit activationBloc;
  int secondsToResend = waitingTime;
  bool btnEnable = false;

  // todo replace the mobile counter with the server side limitation error.
  int count = 1;

  late DateTime pageOpen;

  late Timer timer;

  @override
  initState() {
    super.initState();
    pageOpen = DateTime.now();
    activationBloc = BlocProvider.of<ActivationCubit>(context);

    getSMSAutoFillSignature();
    listenOtp();

    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      onCodeChanged(code.text);
    });
  }

  @override
  dispose() {
    activationBloc.close();
    timer.cancel();
    super.dispose();
  }

  getSMSAutoFillSignature() async {
    final signCode = await SmsAutoFill().getAppSignature;
    debugPrint("SmsAutoFill signCode: $signCode");
  }

  listenOtp() async {
    SmsAutoFill().listenForCode;
  }

  @override
  Widget build(BuildContext context) {
    return FixitStatusBar(
      child: BlocConsumer<ActivationCubit, ActivationState>(
          listener: _authBlocListener,
          builder: (BuildContext context, ActivationState state) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: Constant.greyColorRegular,
                centerTitle: true,
                title: Text(
                  Strings.activation,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: AppFontFamily.medium,
                  ),
                ),
                leading: IconButton(
                  icon: SvgPicture.asset(Assets.back),
                  onPressed: onBack,
                ),
              ),
              body: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: 140,
                    child: SingleChildScrollView(
                      child: Column(
                        //num.svg
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 20.0,
                              left: 20,
                              top: 40,
                            ),
                            child: Text(
                              Strings.activationNote,
                              style: const TextStyle(
                                color: Constant.navyColorExtraDark,
                                fontSize: 17,
                                fontFamily: AppFontFamily.regular,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 20.0,
                              left: 8,
                              top: 8,
                            ),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  Strings.mobileLabel2,
                                  style: const TextStyle(
                                    color: Constant.navyColorExtraDark,
                                    fontSize: 17,
                                    fontFamily: AppFontFamily.regular,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  appBloc.fullMobile ?? '',
                                  style: const TextStyle(
                                    color: Constant.violetColorDark,
                                    fontSize: 17,
                                    fontFamily: AppFontFamily.regular,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              right: 20.0,
                              left: 20,
                              top: 20,
                              bottom: 20,
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 30,
                                  margin: const EdgeInsets.all(
                                    5,
                                  ),
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Constant.greyColorRegular,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Center(
                                    child: CountDownTimer(
                                      whenTimeExpires: whenTimeExpires,
                                      secondsRemaining: secondsToResend,
                                      countDownTimerStyle: const TextStyle(
                                        color: Constant.navyColorExtraDark,
                                        fontSize: 15,
                                        fontFamily: AppFontFamily.regular,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          FixitCodeTextFieldWidget(
                            onChanged: onCodeChanged,
                            errorString: activationBloc.getError("code"),
                            onActiveTyping: () {
                              activationBloc.hideError('code');
                            },
                            controller: code,
                            fontSize: 35,
                            svgWidth: 35,
                            label: "####",
                            hintText: "####",
                            svgIcon: Assets.code,
                            type: FixitTextType.number,
                            maxLength: 4,
                            autoFocus: true,
                          ),
                          InkWell(
                            child: Container(
                              padding: const EdgeInsets.only(
                                right: 20.0,
                                left: 20,
                                top: 20,
                                bottom: 20,
                              ),
                              child: Visibility(
                                visible: timerEnded,
                                child: Row(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      Assets.resend,
                                      color: maxTries
                                          ? Constant.greyColorExtraDark
                                          : Constant.violetColorDark,
                                    ),
                                    const SizedBox(width: 10),
                                    InkWell(
                                      onTap: onResend,
                                      child: Text(
                                        Strings.resendActivationCode,
                                        style: TextStyle(
                                          color: maxTries
                                              ? Constant.greyColorExtraDark
                                              : Constant.violetColorDark,
                                          fontSize: 15,
                                          fontFamily: AppFontFamily.regular,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
//                          Visibility(
//                            visible: maxTries,
//                            child: CallSupport(onTap: onSupport),
//                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    right: 20,
                    left: 20,
                    child: SafeArea(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: FixitButton(
                                  label: Strings.activate,
                                  loading: state is ActivationLoading,
                                  background: cannotResend
                                      ? Constant.greyColorRegular
                                      : Constant.violetColorDark,
                                  labelColor: cannotResend
                                      ? Constant.navyColorLight
                                      : Colors.white,
                                  onTab: onActivate,
                                ),
                              ),
                              if (maxTries)
                                const SizedBox(
                                  width: 10,
                                ),
                              if (maxTries)
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  child: FixitButton(
                                    label: "الدعم الفني",

                                    background: Constant.yellowColorRegular,
                                    labelColor: Constant.navyColorExtraDark,
//                              border: widget.border2,
                                    onTab: () {},
                                  ),
                                ),
                            ],
                          ),
                          if (maxTries)
                            const SizedBox(
                              height: 10,
                            ),
                          if (maxTries)
                            const Text(
                              "تواصل مع الدعم الفني في حال لم تصلك رسالة التفعيل",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff8E9FA8),
                                fontSize: 12,
                                fontFamily: AppFontFamily.regular,
                              ),
                            )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }

  void _authBlocListener(BuildContext context, ActivationState state) {
    if (state is ActivationSuccess) {
      if (widget.fromForget) {
        // AppRouter.navigator.popAndPushNamed(
        //   AppRouter.resetPasswordPage,
        //   arguments: ResetPasswordPageArguments(
        //       code: code.text,
        //       onSuccess: () {
        //         if (!isSpecialist) {
        //           AppRouter.navigator.off(
        //             AppRouter.welcomePage,
        //           );
        //           AppRouter.navigator.pushNamed(AppRouter.loginPage);
        //         } else {
        //           AppRouter.navigator.pushNamed(AppRouter.loginPage);
        //         }
        //       }),
        // );
      } else if (appBloc.user?.gender != 'unknown') {
        // AppRouter.navigator.pushNamed(AppRouter.homePage);
      } else {
        // AppRouter.navigator.pushNamed(AppRouter.completeProfilePage);
      }
    }

    if (state is ActivationFailed) {
      if (activationBloc.error == null) {
        // Dropdown.show(
        //   state.error,
        //   Constant.redColorRegular,
        //   Constant.greyColorRegular,
        // );
      }
    }
  }

  onActivate() {
    if (cannotResend) return;
    activationBloc.activatePressed(
      code: code.text,
      mobile: appBloc.mobile ?? '',
    );
  }

  onResend() {
    if (maxTries) return;

    setState(() {
      secondsToResend = waitingTime;
    });

    activationBloc.resendCodePressed(mobile: appBloc.mobile ?? '');
  }

  onCodeChanged(str) {
    if (str.length > 0) {
      setState(() {
        btnEnable = true;
      });
    } else {
      setState(() {
        btnEnable = false;
      });
    }
  }

  whenTimeExpires() {
    setState(() {
      secondsToResend = 0;
      count++;
    });
  }

  onBack() {
    // AppRouter.navigator.pop();
  }

  bool get cannotResend =>
      btnEnable == false ? true : maxTries && btnEnable == false;

  bool get timerEnded => secondsToResend == 0;

  bool get maxTries => count > 3;
}
