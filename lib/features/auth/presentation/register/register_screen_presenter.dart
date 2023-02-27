import 'package:bond/core/utils/validator.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final registerScreenPresenter =
    ChangeNotifierProvider.autoDispose<RegisterScreenPresenter>(
  (ref) => RegisterScreenPresenter(),
);

class RegisterScreenPresenter extends ChangeNotifier {
  bool _isNameValid = true;
  bool _isEmailValid = true;
  bool _isPasswordValid = true;
  bool _isPasswordConfirmationValid = true;

  String? getNameErrorText(String errorMessage) =>
      _isNameValid ? null : errorMessage;

  String? getEmailErrorText(String errorMessage) =>
      _isEmailValid ? null : errorMessage;

  String? getPasswordErrorText(String errorMessage) =>
      _isPasswordValid ? null : errorMessage;

  String? getPasswordConfirmationErrorText(String errorMessage) =>
      _isPasswordConfirmationValid ? null : errorMessage;

  bool checkEmailAndPassword({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    _isNameValid = Validator.isFullNameValid(name);
    _isEmailValid = Validator.isEmailValid(email);
    _isPasswordValid = Validator.isPasswordValid(password);
    _isPasswordConfirmationValid = password == confirmPassword;
    notifyListeners();
    return _isNameValid &&
        _isEmailValid &&
        _isPasswordValid &&
        _isPasswordConfirmationValid;
  }
}
