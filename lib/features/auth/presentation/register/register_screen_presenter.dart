import 'package:bond/core/utils/validator.dart';
import 'package:bond/features/auth/data/dto/user_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'register_request_provider.dart';

// 3- TODO: how to test this logic
final registerScreenPresenter =
    ChangeNotifierProvider.autoDispose<RegisterScreenPresenter>(
  (ref) => RegisterScreenPresenter(),
);

enum RegisterScreenPresenterState { initial, loading, success, error }

class RegisterScreenPresenter extends ChangeNotifier {
  final nameController = useTextEditingController();
  final emailController = useTextEditingController();
  final passwordController = useTextEditingController();
  final passwordConfirmationController = useTextEditingController();
  final _state = useState(RegisterScreenPresenterState.initial);

  RegisterScreenPresenterState get state => _state.value;

  bool get loading => state == RegisterScreenPresenterState.loading;

  bool _isNameValid = true;
  bool _isEmailValid = true;
  bool _isPasswordValid = true;
  bool _isPasswordConfirmationValid = true;

  // 2- TODO: read errors message directly from app localizations
  String? getNameErrorText(String errorMessage) =>
      _isNameValid ? null : errorMessage;

  String? getEmailErrorText(String errorMessage) =>
      _isEmailValid ? null : errorMessage;

  String? getPasswordErrorText(String errorMessage) =>
      _isPasswordValid ? null : errorMessage;

  String? getPasswordConfirmationErrorText(String errorMessage) =>
      _isPasswordConfirmationValid ? null : errorMessage;

  void register(WidgetRef ref) {
    _isNameValid = Validator.isFullNameValid(nameController.text);
    _isEmailValid = Validator.isEmailValid(emailController.text);
    _isPasswordValid = Validator.isPasswordValid(passwordController.text);
    _isPasswordConfirmationValid =
        passwordController.text == passwordConfirmationController.text;
    final isValid = _isNameValid &&
        _isEmailValid &&
        _isPasswordValid &&
        _isPasswordConfirmationValid;

    if (isValid) {
      final requestProvider = ref.watch(registerRequestProvider(userDto));

      requestProvider.when(
          data: (_) {
            _state.value = RegisterScreenPresenterState.success;
          },
          error: (_, __) {
            _state.value = RegisterScreenPresenterState.error;
          },
          loading: () => _state.value = RegisterScreenPresenterState.loading);
    }
    notifyListeners();
  }

  UserDto get userDto => UserDto(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
        passwordConfirmation: passwordConfirmationController.text,
      );
}
