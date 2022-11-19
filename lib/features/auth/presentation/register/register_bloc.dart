import 'package:bond/features/auth/data/dto/user_dto.dart';
import 'package:bond/features/auth/data/repositories/auth_repository.dart';
import 'package:bond/features/auth/data/validators/field_validators.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class RegisterBloc extends FormBloc<String, String> {
  final AuthRepository _authRepository;

  RegisterBloc(this._authRepository) {
    addFieldBlocs(
      fieldBlocs: [
        nameTextField,
        emailTextField,
        passwordTextField,
        confirmPassword,
      ],
    );
  }

  final nameTextField = TextFieldBloc(
    validators: [
      FieldBlocValidator.required,
    ],
  );

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

  final confirmPassword = TextFieldBloc(
    validators: [
      FieldBlocValidator.required,
      FieldBlocValidator.passwordMin6Chars,
    ],
  );

  @override
  void onSubmitting() async {
    emitLoading();
    final response = await _authRepository.register(
      UserDto(
        name: nameTextField.value,
        email: emailTextField.value,
        password: passwordTextField.value,
        passwordConfirmation: confirmPassword.value,
      ),
    );
    response.fold(
      (failure) => emitFailure(failureResponse: failure.toMessage()),
      (response) => {emitLoaded(), emitSuccess(), emitSubmissionCancelled()},
    );
  }

  bool get loading => state is FormBlocLoading;
}
