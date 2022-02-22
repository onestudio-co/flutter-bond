import 'package:fixit/core/errors/failures.dart';
import 'package:fixit/core/models/validation_response.dart';
import 'package:fixit/features/auth/data/repositories/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class LoginCubitFixit extends FormBloc<String, String> {
  final AuthRepository authenticationRepository;
  LoginCubitFixit(this.authenticationRepository) {
    addFieldBlocs(
      fieldBlocs: [
        email,
        password,
      ],
    );
  }

  final email = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  final password = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );
  @override
  void onSubmitting() async {
    List<TextFieldBloc> listOfTextFieldBloc = [
      email,
      password,
    ];
    final response = await authenticationRepository.loginFixit(
        email.value.trim(), password.value);
    response.fold(
      (failure) {
        if (failure is ServerFailure) {
          Errors errors = Errors.fromJson(failure.errors);
          int i = 0;
          errors.toJson().forEach((key, listOfErrors) {
            if (listOfErrors != null) {
              listOfTextFieldBloc[i].addFieldError(listOfErrors.join('، '));
            }
            i++;
          });
          emitFailure(failureResponse: 'حدث خطأ ما');
        } else {
          debugPrint('failure is not ServerFailure');
          emitFailure(failureResponse: 'حدث خطأ ما');
        }
      },
      (response) => emitSuccess(),
    );
  }
}
