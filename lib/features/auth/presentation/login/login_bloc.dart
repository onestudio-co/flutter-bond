import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fixit/core/errors/failures.dart';
import 'package:fixit/features/auth/data/repositories/auth_repository.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../data/models/user_meta.dart';

class LoginFormBloc extends FormBloc<String, String> {
  final AuthRepository authenticationRepository;
  LoginFormBloc(this.authenticationRepository) {
    addFieldBlocs(fieldBlocs: [email, password]);
  }

  final email = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.email,
    ],
  );
  final password = TextFieldBloc(validators: [
    FieldBlocValidators.required,
    FieldBlocValidators.passwordMin6Chars,
    //   FieldBlocValidators.confirmPassword()
  ]);

  void addErrors() {
    email.addFieldError('Email field requird!');
    password.addFieldError('Password field requird!!');
  }

  List<dynamic>? data;

  // Map<String, dynamic>? data;

  Future<dynamic> login(
    String email,
    String password,
  ) async {
    Map<String, dynamic> data = <String, dynamic>{
      "email": "",
      "password": password,
    };
    //
    // return SingleResponse(data: data, meta: meta)<Login, UserMeta>(await client.post(
    //   Api.login(),
    //   body: data,
    //   headers: Api.headers(),
    // ));
  }

  // fakeLoginError() async {
  //   // await Future<void>.delayed(const Duration(milliseconds: 500));
  //   var jsonText = await rootBundle.loadString('assets/errors.json');
  //   data = json.decode(jsonText);
  //   if (data!['errors']['email'] != null) {
  //     email.addFieldError(data!['errors']['email']);
  //   }
  //   if (data!['errors']['password'] != null) {
  //     password.addFieldError(data!['errors']['password']);
  //   }
  //   emitFailure(failureResponse: data!.toString());

  //   // for (int i = 0; i <= data!.length; i++) {
  //   //   if (data![i]['errors']['email'] != null) {
  //   //     email.addFieldError(data![i]['errors']['email'][0]);
  //   //   }
  //   //   if (data![i]['errors']['password'] != null) {
  //   //     password.addFieldError(data![i]['errors']['password'][0]);
  //   //   }
  //   // }
  // }

  // login() async {
  //   try {
  //     Map<String, dynamic> data = <String, dynamic>{
  //       "email": email.value,
  //       "password": password.value,
  //     };
  //     var dio = Dio();

  //     var response = await dio.post(
  //       'http://10.0.2.2:8000/api/auth/login',
  //       data: {'email': 'hellhokh@gmail.com', 'password': '1234567'},
  //     );
  //     var jsResponse = jsonDecode(response.toString());

  //     if (jsResponse.toString().contains('errors')) {
  //       if (jsResponse['errors']['password'] != null) {
  //         password.addFieldError(jsResponse!['errors']['password']);
  //       } else if (jsResponse['errors']['email'] != null) {
  //         email.addFieldError(jsResponse!['errors']['email']);
  //       }
  //       emitFailure(failureResponse: jsResponse.toString());
  //     } else {
  //       emitSuccess(successResponse: jsResponse.toString());
  //     }
  //   } catch (e) {
  //     print(e);
  //     emitFailure(failureResponse: e.toString());
  //   }
  // }

  var error;
  var code;

  toMessage(Failure failure) {
    if (failure is ServerFailure) {
      error = failure.error["errors"];
      print(error);
      if (failure.error["code"] != null) {
        code = failure.error["code"];
      }

      if (error['email'][0] != '') {
        email.addFieldError(error['email'][0]);
      } else if (error['password'][0] != '') {
        password.addFieldError(error['password'][0]);
      }
    }

    return failure.toMessage();
  }

  Future<void> loginPressed() async {
    final response = await authenticationRepository.login(
      email.value,
      password.value,
    );

    response.fold((failure) {
      emitFailure(failureResponse: toMessage(failure));
    }, (response) {
      emitSuccess(canSubmitAgain: true);
      print(response.data);
      print(response.meta);
    });
  }

  @override
  void onSubmitting() async {
    await loginPressed();
  }
}
