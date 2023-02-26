import 'package:bond/core/utils/validator.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginScreenPresenter =
    ChangeNotifierProvider.autoDispose<LoginScreenPresenter>(
  (ref) => LoginScreenPresenter(),
);

class LoginScreenPresenter extends ChangeNotifier {
  bool _isEmailValid = true;

  bool _isPasswordValid = true;

  String? getEmailErrorText(String errorMessage) =>
      _isEmailValid ? null : errorMessage;

  String? getPasswordErrorText(String errorMessage) =>
      _isPasswordValid ? null : errorMessage;

  bool checkEmailAndPassword(String email, String password) {
    _isEmailValid = Validator.isEmailValid(email);
    _isPasswordValid = Validator.isPasswordValid(password);
    notifyListeners();
    return _isEmailValid && _isPasswordValid;
  }
}
