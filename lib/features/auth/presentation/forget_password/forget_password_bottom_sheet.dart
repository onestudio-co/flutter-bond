import 'package:fixit/core/assets.dart';
import 'package:fixit/core/constants.dart';
import 'package:fixit/core/fixit_alert.dart';
import 'package:fixit/core/widgets/fixit_button.dart';
import 'package:fixit/core/widgets/fixit_text_field.dart';
import 'package:fixit/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'forget_password_cubit.dart';
import 'forget_password_state.dart';

class ForgetPasswordBottomSheet extends StatefulWidget {
  const ForgetPasswordBottomSheet({Key? key}) : super(key: key);

  @override
  _ForgetPasswordBottomSheetState createState() =>
      _ForgetPasswordBottomSheetState();
}

class _ForgetPasswordBottomSheetState extends State<ForgetPasswordBottomSheet> {
  final TextEditingController mobileForget = TextEditingController();

  final ForgetPasswordCubit forgetPasswordCubit = sl<ForgetPasswordCubit>();
  bool sendButtonEnable = false;

  refreshSendButtonEnable(String txt) {
    forgetPasswordCubit.hideError('mobile');
    setState(() {
      sendButtonEnable = mobileForget.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    mobileForget.text = appBloc.mobile ?? '';
    refreshSendButtonEnable("");
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      bloc: forgetPasswordCubit,
      listener: (context, state) {
        if (state is ForgetPasswordSuccess) {
          appBloc.mobile = mobileForget.text;
          Navigator.pop(context);
          // AppRouter.navigator.pushNamed(
          //   AppRouter.activationPage,
          //   arguments: ActivationPageArguments(
          //     fromForget: true,
          //   ),
          // );
        }
        if (state is ForgetPasswordFailed) {
          if (forgetPasswordCubit.error == null) {
            FixitAlert.showNotificationBottom(context,
                title: state.error, inLastBottom: false);
          }
        }
      },
      child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
        bloc: forgetPasswordCubit,
        builder: (BuildContext context, ForgetPasswordState state) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  top: 0,
                  left: 10,
                  right: 10,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(Strings.forgetPasswordQuestion,
                            style: const TextStyle(
                              color: Constant.navyColorExtraDark,
                              fontSize: 17,
                              fontFamily: AppFontFamily.medium,
                            )),
                        InkWell(
                            onTap: () {
                              //   AppRouter.navigator.pop();
                            },
                            child: SvgPicture.asset(Assets.close))
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                      left: 10,
                      top: 15,
                      bottom: 10,
                    ),
                    child: Text(
                      Strings.forgetPasswordMessage,
                      style: const TextStyle(
                        color: Constant.navyColorExtraDark,
                        fontSize: 15,
                        fontFamily: AppFontFamily.light,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FixitTextFieldWidget(
                    controller: mobileForget,
                    errorString: forgetPasswordCubit.getError('mobile')?.trim(),
                    onActiveTyping: () {
                      forgetPasswordCubit.hideError('mobile');
                    },
                    onChanged: refreshSendButtonEnable,
                    autoFocus: true,
                    label: Strings.mobileLabel,
                    svgIcon: "assets/images/mobile.svg",
                    marginLeft: 13,
                    marginRight: 13,
                    type: FixitTextType.mobile,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 50, bottom: 20, left: 10, right: 10),
                    child: FixitButton(
                      loading: state is ForgetPasswordLoading,
                      enable: sendButtonEnable,
                      closekeyboard: false,
                      onTab: () {
                        forgetPasswordCubit.forgetPressed(
                          mobile: mobileForget.text.toString(),
                        );
                      },
                      label: Strings.reset,
                      background: Constant.violetColorDark,
                      labelColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
