import 'package:auto_route/auto_route.dart';
import 'package:bond/core/app_localizations.dart';
import 'package:bond/core/resources/app_assets.dart';
import 'package:bond/core/widgets/app_button.dart';
import 'package:bond/core/widgets/bond_password_text_form_field.dart';
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
    final loginScreenPresenter = ref.watch(loginScreenProvider);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isLoading = useState(false);
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
                      errorText: loginScreenPresenter.isEmailValid ?? true
                          ? null
                          : context.localizations.field_validator_email,
                    ),
                  ),
                  const SizedBox(height: 12),
                  BondPasswordTextFormField(
                    controller: passwordController,
                    hintText: context.localizations.filed_password_label,
                    errorText: loginScreenPresenter.isPasswordValid ?? true
                        ? null
                        : context.localizations.field_validator_password,
                  ),
                  const SizedBox(height: 16),
                  AppButton(
                    loading: isLoading.value,
                    onPressed: () async{
                      loginScreenPresenter.onSignInPressed(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                      if ((loginScreenPresenter.isEmailValid ?? false) &&
                          (loginScreenPresenter.isPasswordValid ?? false)) {
                        isLoading.value = true;
                        isLoading.value = await ref.read(loginRequestProvider.notifier).login(
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
    ref.listen<SingleMResponse<User, UserMeta>?>(loginRequestProvider,
        (previous, next) {

      if (next?.data != null) {
        context.router.replaceAll([const MainRoute()]);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('login failed'),
          ),
        );
      }
    });
  }
}
