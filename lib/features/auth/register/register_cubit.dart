import 'package:fixit/core/errors/failures.dart';
import 'package:fixit/core/models/validation_response.dart';
import 'package:fixit/features/auth/data/dto/user_register.dart';
import 'package:fixit/features/auth/data/repositories/auth_repository.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class RegisterCubitFixit extends FormBloc<String, String> {
  final AuthRepository authenticationRepository;
  RegisterCubitFixit(this.authenticationRepository) {
    addFieldBlocs(
      fieldBlocs: [
        userName,
        email,
        password,
        mobileNumber,
      ],
    );
  }

  final userName = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

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
  final mobileNumber = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  @override
  void onSubmitting() async {
    List<TextFieldBloc> listOfTextFieldBloc = [
      userName,
      email,
      password,
      mobileNumber,
    ];
    UserDto user = UserDto(
      userName: userName.value,
      email: email.value,
      password: password.value,
      mobile: mobileNumber.value,
    );
    final response = await authenticationRepository.registerFixit(user);

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
          print('failure is not ServerFailure');
          emitFailure(failureResponse: 'حدث خطأ ما');
        }
      },
      (response) => emitSuccess(),
    );
  }

  // Map<String, dynamic> validationJsonResponse = {
  //   "message": "هذه البيانات غير صحيحة",
  //   "errors": {
  //     "email": [
  //       "هذا الايميل موجود مسبقاً",
  //       "الخطأ الثاني",
  //     ],
  //     "password": [
  //       "1 كلمة المرور",
  //       "2 كلمة المرور",
  //     ],
  //     "username": [
  //       "الاسم ",
  //     ],
  //     // "mobile": []
  //   }
  // };

  // print(validationResponse);
  // if (false) {
  //   emitSuccess();
  // } else {
  // int i = 0;
  // validationResponse.forEach((key, listOfErrors) {
  //   if (listOfErrors != null) {
  //     if (listOfErrors.isNotEmpty) {
  //       listOfTextFieldBloc[i].addFieldError(listOfErrors.join('، '));
  //     }
  //   }
  //   i++;
  // });
  // emitFailure(failureResponse: 'حدث خطأ ما');
  // }
}

  // Future<Map<String, List<String>?>> _register() async {
  //   User user = User.model(
  //     userName: userName.value,
  //     email: email.value,
  //     password: password.value,
  //     mobile: mobileNumber.value,
  //   );

  // ValidationResponse validationResponse =
  //     ValidationResponse.fromJson(validationJsonResponse);
  // return validationResponse.errors?.toJson() ?? {};
  // }

  // Future<void> _register() async {
  //   User user = User.model(
  //     userName: userName.value,
  //     email: email.value,
  //     password: password.value,
  //     mobile: mobileNumber.value,
  //   );
  //   final response = await authenticationRepository.register(user);

    // emit(response.fold(
    //   (failure) => RegisterFailed(error: toMessage(failure)),
    //   (response) => RegisterSuccess(user: response.data),
    // ));
//   }
// }

/* 
 Response registerResponse = await Dio().post(
      'http://10.0.2.2:8000/api/users',
      data: {
        'username': userName.value,
        'email': email.value,
        'password': password.value,
        'mobile': mobileNumber.value,
      },
    );

 */

// for (String element in listOfValidation) {
//   if (element == 'email') {
//     // email.addFieldError(element);
//     print('email -------->');
//   } else if (element == 'password') {
//     print('password -------->');
//   }
// }
// email.addFieldError('هذا الايميل موجود مسبقاً');
// password.addFieldError('1 كلمة المرور');

// bool isSuccess = Random().nextBool();
// isSuccess = Random().nextBool();

/* 

 Map<dynamic, dynamic> validationJsonResponse = {
    "message": "هذه البيانات غير صحيحة",
    "errors": {
      "user_name": [
        "الاسم ",
      ],
      "email": [
        "هذا الايميل موجود مسبقاً",
        "الخطأ الثاني",
      ],
      "password": [
        "1 كلمة المرور",
        "2 كلمة المرور",
      ],
      "mobile": []
    }
    // Map<String, List> listOfValidation = validationJsonResponse['errors'];
  };
 */














/* 
This work without api
Map<String, dynamic> validationJsonResponse = {
    "message": "هذه البيانات غير صحيحة",
    "errors": {
      "email": [
        "هذا الايميل موجود مسبقاً",
        "الخطأ الثاني",
      ],
      "password": [
        "1 كلمة المرور",
        "2 كلمة المرور",
      ],
      "username": [
        "الاسم ",
      ],
      // "mobile": []
    }
  };

  @override
  void onSubmitting() async {
    List<TextFieldBloc> listOfTextFieldBloc = [
      userName,
      email,
      password,
      mobileNumber,
    ];
    Map<String, List<String>?> validationResponse = await _register();
    print(validationResponse);
    if (false) {
      emitSuccess();
    } else {
      int i = 0;
      validationResponse.forEach((key, listOfErrors) {
        if (listOfErrors != null) {
          if (listOfErrors.isNotEmpty) {
            listOfTextFieldBloc[i].addFieldError(listOfErrors.join('، '));
          }
        }
        i++;
      });
      emitFailure(failureResponse: 'حدث خطأ ما');
    }
  }

  Future<Map<String, List<String>?>> _register() async {
    User user = User.model(
      userName: userName.value,
      email: email.value,
      password: password.value,
      mobile: mobileNumber.value,
    );

    ValidationResponse validationResponse =
        ValidationResponse.fromJson(validationJsonResponse);
    return validationResponse.errors?.toJson() ?? {};
  }
}
 */