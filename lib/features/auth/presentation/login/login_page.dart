import 'package:auto_route/auto_route.dart';
import 'package:bond/core/app_localizations.dart';
import 'package:bond/core/resources/app_assets.dart';
import 'package:bond/core/widgets/app_button.dart';
import 'package:bond/core/widgets/app_password_text_form_field.dart';
import 'package:bond/core/widgets/bond_pop_menu/bond_pop_menu_button.dart';
import 'package:bond/features/auth/data/models/user.dart';
import 'package:bond/features/auth/data/models/user_meta.dart';
import 'package:bond/features/auth/presentation/login/login_request_provider.dart';
import 'package:bond/features/auth/presentation/login/login_screen_presenter.dart';
import 'package:bond/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_studio_core/core.dart';
import 'new_account_view.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginPresenter = ref.watch(loginScreenPresenter);
    final loginRequest = ref.watch(loginRequestProvider);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    _listenerOnLogin(context, ref);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.login_page_title),
        actions: const [BondPopMenuButton()],
      ),
      body: SingleChildScrollView(
        child: AutofillGroup(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 64),
                  SvgPicture.asset(
                    AppImagesAssets.logo,
                    width: 95,
                    height: 120,
                  ),
                  const SizedBox(height: 48),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: context.localizations.filed_email_label,
                      prefixIcon: const Icon(Icons.email),
                      errorText: loginPresenter.getEmailErrorText(
                          context.localizations.field_validator_email),
                    ),
                  ),
                  const SizedBox(height: 12),
                  AppPasswordTextFormField(
                    controller: passwordController,
                    hintText: context.localizations.filed_password_label,
                    errorText: loginPresenter.getPasswordErrorText(
                        context.localizations.field_validator_password),
                  ),
                  const SizedBox(height: 16),
                  AppButton(
                    loading: loginRequest.isLoading,
                    onPressed: () {
                      bool validation = loginPresenter.checkEmailAndPassword(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                      if (validation) {
                        ref.read(loginRequestProvider.notifier).login(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            );
                      }
                    },
                    title: context.localizations.login_page_login_button,
                  ),
                  const SizedBox(height: 16),
                  const NewAccountView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _listenerOnLogin(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<SingleMResponse<User, UserMeta>?>>(
        loginRequestProvider, (previous, next) {
      if (next.value?.meta.token != null) {
        context.router.replaceAll([const MainRoute()]);
      } else if (next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.localizations.field_login),
          ),
        );
      }
    });
  }
}
