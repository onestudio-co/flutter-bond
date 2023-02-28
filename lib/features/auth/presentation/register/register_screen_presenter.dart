import 'dart:developer';

import 'package:bond/core/utils/validator.dart';
import 'package:bond/features/auth/auth.dart';
import 'package:bond/features/auth/data/dto/user_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_studio_core/core.dart';

import 'register_request_provider.dart';

// 3- TODO: how to test this logic
final registerScreenPresenter =
    ChangeNotifierProvider.autoDispose<RegisterScreenPresenter>(
  (ref) => RegisterScreenPresenter(rif),
);

enum RegisterScreenPresenterState { initial, loading, success, error }

class RegisterScreenPresenter extends ChangeNotifier {
  RegisterScreenPresenterState _registerState =
      RegisterScreenPresenterState.initial;

  RegisterScreenPresenterState get state => _registerState;

  bool get loading => state == RegisterScreenPresenterState.loading;

  bool _isNameValid = true;
  bool _isEmailValid = true;
  bool _isPasswordValid = true;
  bool _isPasswordConfirmationValid = true;
  AsyncValue<SingleMResponse<User, UserMeta>?> registerResult =
      const AsyncValue.data(null);

  // 2- TODO: read errors message directly from app localizations
  String? getNameErrorText(String errorMessage) =>
      _isNameValid ? null : errorMessage;

  String? getEmailErrorText(String errorMessage) =>
      _isEmailValid ? null : errorMessage;

  String? getPasswordErrorText(String errorMessage) =>
      _isPasswordValid ? null : errorMessage;

  String? getPasswordConfirmationErrorText(String errorMessage) =>
      _isPasswordConfirmationValid ? null : errorMessage;

  void register(
    WidgetRef ref, {
    required String email,
    required String name,
    required String password,
    required String passwordConfirmation,
  }) {
    _isNameValid = Validator.isFullNameValid(name);
    _isEmailValid = Validator.isEmailValid(email);
    _isPasswordValid = Validator.isPasswordValid(password);
    _isPasswordConfirmationValid = password == passwordConfirmation;
    final isValid = _isNameValid &&
        _isEmailValid &&
        _isPasswordValid &&
        _isPasswordConfirmationValid;

    if (isValid) {
      final userDto = UserDto(
        email: email,
        password: password,
        name: name,
        passwordConfirmation: passwordConfirmation,
      );
      final requestProvider = ref.watch(registerRequestProvider(userDto));

      requestProvider.when(
        data: (data) {
          log(' RegisterScreenPresenterState.success');
          _registerState = RegisterScreenPresenterState.success;
          registerResult = data;
        },
        error: (error, stackTrace) {
          log(' RegisterScreenPresenterState.error');
          _registerState = RegisterScreenPresenterState.error;
          registerResult = AsyncValue.error(error, stackTrace);
        },
        loading: () {
          log(' RegisterScreenPresenterState.loading');
          _registerState = RegisterScreenPresenterState.loading;
          registerResult = const AsyncValue.loading();
        },
      );
    }
    notifyListeners();
  }
}
