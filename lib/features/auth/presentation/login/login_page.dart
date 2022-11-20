import 'package:auto_route/auto_route.dart';
import 'package:bond/core/app_localizations.dart';
import 'package:bond/core/resources/app_assets.dart';
import 'package:bond/core/widgets/app_button.dart';
import 'package:bond/core/widgets/bond_pop_menu/bond_pop_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one_studio_core/core.dart';

import 'login_bloc.dart';
import 'new_account_view.dart';

class LoginPage extends StatelessWidget with AutoRouteWrapper {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider<LoginBloc>(
        create: (BuildContext context) => sl<LoginBloc>(),
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.watch<LoginBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.login_page_title),
        actions: const [BondPopMenuButton()],
      ),
      body: FormBlocListener<LoginBloc, String, String>(
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
                    const SizedBox(height: 16),
                    AppButton(
                      loading: loginBloc.loading,
                      onPressed: loginBloc.submit,
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
    context.router.pop(true);
  }
}
