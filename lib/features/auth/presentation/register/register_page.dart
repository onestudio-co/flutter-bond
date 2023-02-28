import 'dart:developer';

import 'package:bond/core/app_localizations.dart';
import 'package:bond/core/app_widgets.dart';
import 'package:bond/core/resources/app_assets.dart';
import 'package:bond/features/auth/presentation/register/register_screen_presenter.dart';
import 'package:bond/routes/app_router.dart';
import 'package:flutter/material.dart';
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
    ref.listen(
      registerScreenPresenter,
      (previous, next) => _registerScreenPresenter(
        context,
        previous,
        next,
      ),
    );
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
                    loading: registerPresenter.registerResult.isLoading,
                    onPressed: () => registerPresenter.register(
                      ref,
                      email: emailController.text.trim(),
                      name: nameController.text.trim(),
                      password: passwordController.text.trim(),
                      passwordConfirmation:
                          passwordConfirmationController.text.trim(),
                    ),
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

  void _registerScreenPresenter(
    BuildContext context,
    RegisterScreenPresenter? previous,
    RegisterScreenPresenter next,
  ) {
    if (next.registerResult.hasValue) {
      final data = next.registerResult.value;
      log('user register data ${data.toString()}');
      if (data != null) {
        appRouter.replaceAll([const MainRoute()]);
      }
    } else if (next.registerResult.hasError) {
      final error = next.registerResult.error;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
        ),
      );
    }
    log('test state is : ${next.state.name}');
    switch (next.state) {
      case RegisterScreenPresenterState.initial:
        break;
      case RegisterScreenPresenterState.loading:
        break;
      case RegisterScreenPresenterState.success:
        final user = next.registerResult.value; // 1- TODO: get success data
        appRouter.replaceAll([const MainRoute()]);
        break;
      case RegisterScreenPresenterState.error:
        final error = next.registerResult
            .error; // 1- TODO: best way to get error text from presenter
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.toString()),
          ),
        );
        break;
    }
  }
}
