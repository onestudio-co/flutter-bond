import 'package:auto_route/auto_route.dart';
import 'package:bond/core/app_localizations.dart';
import 'package:bond/core/resources/app_assets.dart';
import 'package:bond/core/widgets/app_button.dart';
import 'package:bond/core/widgets/bond_pop_menu/bond_pop_menu_button.dart';
import 'package:bond/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one_studio_core/core.dart';

import 'register_bloc.dart';

class RegisterPage extends StatelessWidget with AutoRouteWrapper {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider<RegisterBloc>(
        create: (BuildContext context) => sl<RegisterBloc>(),
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.watch<RegisterBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.register_page_title),
        actions: const [
          BondPopMenuButton(),
        ],
      ),
      body: FormBlocListener<RegisterBloc, String, String>(
        onSuccess: _onSuccess,
        onFailure: _onFailure,
        child: SingleChildScrollView(
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
                    TextFieldBlocBuilder(
                      textFieldBloc: loginBloc.nameTextField,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: context.localizations.filed_name_label,
                        prefixIcon: const Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextFieldBlocBuilder(
                      textFieldBloc: loginBloc.emailTextField,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: context.localizations.filed_email_label,
                        prefixIcon: const Icon(Icons.email),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextFieldBlocBuilder(
                      textFieldBloc: loginBloc.passwordTextField,
                      suffixButton: SuffixButton.obscureText,
                      decoration: InputDecoration(
                        labelText: context.localizations.filed_password_label,
                        prefixIcon: const Icon(Icons.lock),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextFieldBlocBuilder(
                      textFieldBloc: loginBloc.confirmPassword,
                      suffixButton: SuffixButton.obscureText,
                      decoration: InputDecoration(
                        labelText:
                            context.localizations.filed_confirm_password_label,
                        prefixIcon: const Icon(Icons.lock),
                      ),
                    ),
                    const SizedBox(height: 16),
                    AppButton(
                      loading: loginBloc.loading,
                      onPressed: loginBloc.submit,
                      title: context.localizations.login_page_register_button,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onFailure(BuildContext context, FormBlocFailure<String, String> state) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(state.failureResponse ?? ''),
      ),
    );
  }

  void _onSuccess(BuildContext context, FormBlocSuccess<String, String> state) {
    context.router.replaceAll([const HomeRoute()]);
  }
}
