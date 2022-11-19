import 'package:bond/features/auth/data/dto/user_dto.dart';
import 'package:bond/features/auth/data/repositories/auth_repository.dart';
import 'package:bond/features/auth/data/validators/field_validators.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

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
      (failure) => emitFailure(failureResponse: failure.toMessage()),
      (response) => {emitLoaded(), emitSuccess(), emitSubmissionCancelled()},
    );
  }

  bool get loading => state is FormBlocLoading;
}
