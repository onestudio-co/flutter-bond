import 'package:fixit/core/assets.dart';
import 'package:fixit/core/dialogs.dart';
import 'package:fixit/core/fixit_alert.dart';
import 'package:fixit/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../social_account_login_state.dart';
import '../social_account_login_widget.dart';
import 'google_account_login_cubit.dart';

class GoogleAccountLoginWidget extends SocialAccountLoginWidget {
  const GoogleAccountLoginWidget({Key? key}) : super(key: key);

  @override
  bool get visible => true;

  @override
  String get icon => Assets.googleIcon;

  @override
  String get title => 'التسجيل باستخدام Google';

  @override
  Color get backgroundColor => Colors.white;

  @override
  Color get textColor => const Color(0xff167EE6);

  @override
  Function(BuildContext context) get onPressed => (BuildContext context) {
        BlocProvider.of<GoogleAccountLoginCubit>(context).login();
      };

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GoogleAccountLoginCubit>(
      create: (_) => sl<GoogleAccountLoginCubit>(),
      child: BlocListener<GoogleAccountLoginCubit, SocialAccountLoginState>(
        listener: _cubitListener,
        child: super.build(context),
      ),
    );
  }

  void _cubitListener(BuildContext context, SocialAccountLoginState state) {
    if (state is SocialAccountLoginLoading) {
      showLoading(context);
    }

    if (state is SocialAccountLoginSuccess) {
      hideLoading(context);
      debugPrint('user is:${state.user.toJson()}');
      if (state.user.dob != null) {
        //     AppRouter.navigator.pushNamed(AppRouter.homePage);
      } else {
        // AppRouter.navigator.pushNamed(AppRouter.completeProfilePage);
      }
    }

    if (state is SocialAccountLoginFailed) {
      hideLoading(context);
      FixitAlert.showNotificationBottom(context,
          title: 'عذراً، لقد حدث خطأ ما، حاول التسجيل مرة أخرى.',
          inLastBottom: true);
    }
  }
}
