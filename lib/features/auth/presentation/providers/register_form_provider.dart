import 'dart:developer';

import 'package:bond/features/auth/auth.dart';
import 'package:bond/features/auth/data/api.dart';
import 'package:bond_core/bond_core.dart';
import 'package:bond_form/bond_form.dart';
import 'package:bond_form_riverpod/bond_form_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterFormController extends FormStateNotifier<User, Error> {
  final AuthApi authApi;

  RegisterFormController(this.authApi);

  @override
  Map<String, FormFieldState> fields() => {
        'email': TextFieldState(
          null,
          label: 'Email',
          rules: [
            Rules.required(),
            Rules.email(),
          ],
        ),
        'password': TextFieldState(
          null,
          label: 'Password',
          rules: [
            Rules.required(),
            Rules.minLength(6),
            Rules.alphaNum(),
          ],
        ),
      };

  @override
  Future<User> onSubmit() async {
    final email = state.get('email').value;
    final password = state.get('password').value;
    log('email: $email, password: $password');
    final body = {
      'email': email,
      'password': password,
    };
    final response = await authApi.register(body);
    return response.data;
  }
}

final registerProvider =
    NotifierProvider<RegisterFormController, BondFormState<User, Error>>(
  () => RegisterFormController(
    sl(),
  ),
);
