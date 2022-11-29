import 'package:bond/features/auth/data/dto/user_dto.dart';
import 'package:bond/features/auth/data/repositories/auth_repository.dart';
import 'package:bond/features/auth/data/validators/field_validators.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:one_studio_core/core.dart';

class LoginBloc extends FormBloc<String, String> {
  final AuthRepository _authRepository;

  LoginBloc(this._authRepository) {
    addFieldBlocs(
      fieldBlocs: [
        emailTextField,
        passwordTextField,
      ],
    );
  }

  final emailTextField = TextFieldBloc(
    validators: [
      FieldBlocValidator.required,
      FieldBlocValidator.email,
    ],
  );

  final passwordTextField = TextFieldBloc(
    validators: [
      FieldBlocValidator.required,
      FieldBlocValidator.passwordMin6Chars,
    ],
  );

  @override
  void onSubmitting() async {
    emitLoading();
    final response = await _authRepository.login(
      UserDto(
        email: emailTextField.value,
        password: passwordTextField.value,
      ),
    );
    response.fold(
      (failure) => _handleFailure(failure),
      (response) => {emitLoaded(), emitSuccess(), emitSubmissionCancelled()},
    );
  }

  void _handleFailure(Failure failure) {
    if (failure is ServerFailure && failure.code == 422) {
      failure.errors.forEach((key, value) {
        _mapOfTextFieldBloc[key].addFieldError(value.join(', '));
      });
    }
    emitFailure(failureResponse: failure.toMessage());
  }

  bool get loading => state is FormBlocLoading;

  Map<String, dynamic> get _mapOfTextFieldBloc => {
        'email': emailTextField,
        'password': passwordTextField,
      };
}
