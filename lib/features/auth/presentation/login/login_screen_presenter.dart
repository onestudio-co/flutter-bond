import 'package:bond/utils/validator.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginScreenProvider = ChangeNotifierProvider.autoDispose<LoginScreenPresenter>(
  (ref) => LoginScreenPresenter(),
);

class LoginScreenPresenter extends ChangeNotifier {
  bool? _isEmailValid;

  bool? get isEmailValid => _isEmailValid;

  bool? _isPasswordValid;

  bool? get isPasswordValid => _isPasswordValid;

  void onSignInPressed(String email, String password) {
    _isEmailValid = Validator.isEmailValid(email);
    _isPasswordValid = Validator.isPasswordValid(password);
    notifyListeners();
  }
}
