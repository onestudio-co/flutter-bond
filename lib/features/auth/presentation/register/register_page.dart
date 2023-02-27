import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:bond/core/app_localizations.dart';
import 'package:bond/core/app_widgets.dart';
import 'package:bond/core/resources/app_assets.dart';
import 'package:bond/features/auth/data/dto/user_dto.dart';
import 'package:bond/features/auth/presentation/register/register_request_provider.dart';
import 'package:bond/features/auth/presentation/register/register_screen_presenter.dart';
import 'package:bond/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterPage extends HookConsumerWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final passwordConfirmationController = useTextEditingController();
    final registerPresenter = ref.watch(registerScreenPresenter);
    final isLoading = useState(false);
    // this cause server error because send request with empty data
    _onRegisterListener(
        context,
        ref,
        getUserDto(
          emailController,
          passwordController,
          nameController,
          passwordConfirmationController,
        ));
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.register_page_title),
        actions: const [
          BondPopMenuButton(),
        ],
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
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: context.localizations.filed_name_label,
                      prefixIcon: const Icon(Icons.person),
                      errorText: registerPresenter.getNameErrorText(
                          context.localizations.field_validator_required),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: context.localizations.filed_email_label,
                      prefixIcon: const Icon(Icons.email),
                      errorText: registerPresenter.getEmailErrorText(
                        context.localizations.field_validator_email,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  AppPasswordTextFormField(
                    controller: passwordController,
                    hintText: context.localizations.filed_password_label,
                    errorText:
                        registerPresenter.getPasswordConfirmationErrorText(
                      context.localizations.field_validator_confirm_password,
                    ),
                  ),
                  const SizedBox(height: 12),
                  AppPasswordTextFormField(
                    controller: passwordConfirmationController,
                    hintText:
                        context.localizations.filed_confirm_password_label,
                    errorText:
                        registerPresenter.getPasswordConfirmationErrorText(
                      context.localizations.field_validator_confirm_password,
                    ),
                  ),
                  const SizedBox(height: 16),
                  AppButton(
                    loading: isLoading.value,
                    onPressed: () {
                      bool valid = registerPresenter.checkEmailAndPassword(
                        name: nameController.text.trim(),
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                        confirmPassword:
                            passwordConfirmationController.text.trim(),
                      );
                      log('register is valid $valid');
                      if (valid) {
                        ref.read(registerRequestProvider(getUserDto(
                          emailController,
                          passwordController,
                          nameController,
                          passwordConfirmationController,
                        )));
                      } else {
                        log('is not valid');
                      }
                    },
                    title: context.localizations.login_page_register_button,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  UserDto getUserDto(
      TextEditingController emailController,
      TextEditingController passwordController,
      TextEditingController nameController,
      TextEditingController passwordConfirmationController) {
    return UserDto(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      name: nameController.text.trim(),
      passwordConfirmation: passwordConfirmationController.text.trim(),
    );
  }


  void _onRegisterListener(
      BuildContext context, WidgetRef ref, UserDto userDto) {
    ref.listen(registerRequestProvider(userDto), (previous, next) {
      next.when(
        data: (data) {
          if (data.value?.meta.token != null) {
            context.router.replaceAll([const MainRoute()]);
          }
        },
        error: (error, stack) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.toString()),
            ),
          );
        },
        loading: () {},
      );
    });
  }
}
