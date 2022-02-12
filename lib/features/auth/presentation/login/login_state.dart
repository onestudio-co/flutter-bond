import 'package:equatable/equatable.dart';
import 'package:fixit/core/errors/failures.dart';

import '../../data/models/user.dart';

enum FormStatus { initial, valid, inProgress, success, failed }

class LoginFormStatus extends Equatable {
  const LoginFormStatus._(this.formStatus, this.user, this.failure);
  const LoginFormStatus.initial() : this._(FormStatus.initial, null, null);
  const LoginFormStatus.valid() : this._(FormStatus.valid, null, null);
  const LoginFormStatus.loading() : this._(FormStatus.inProgress, null, null);
  const LoginFormStatus.success({required User user})
      : this._(FormStatus.success, user, null);
  const LoginFormStatus.failure({required Failure failure})
      : this._(FormStatus.failed, null, failure);

  final FormStatus formStatus;
  final User? user;
  final Failure? failure;

  LoginFormStatus copyWith({
    FormStatus? formStatus,
    User? user,
    Failure? failure,
  }) {
    return LoginFormStatus._(
      formStatus ?? this.formStatus,
      user ?? this.user,
      failure ?? this.failure,
    );
  }

  String? getError(String key) {
    Map<String, dynamic>? errors;
    if (failure is ServerFailure) {
      errors = (failure as ServerFailure).error["errors"];
    }
    if (errors == null) {
      return null;
    }
    if (errors[key] == null) {
      return null;
    } else {
      return errors[key].toString().replaceAll("[", " ").replaceAll("]", " ");
    }
  }

  bool get notVerified =>
      (failure as ServerFailure).error['code'] == 'not_verified';

  @override
  List<Object> get props => [formStatus];

  @override
  String toString() {
    return '''{formStatus: $formStatus, user: ${user?.name}, failure: ${failure.toString()}}''';
  }
}

class LoginState extends Equatable {
  const LoginState({
    this.status = const LoginFormStatus.initial(),
    this.mobile = const InputField.empty(),
    this.password = const InputField.empty(),
  });

  const LoginState.initial({
    this.status = const LoginFormStatus.initial(),
    this.mobile = const InputField.empty(),
    this.password = const InputField.empty(),
  });

  final LoginFormStatus status;
  final InputField mobile;
  final InputField password;

  LoginState copyWith({
    LoginFormStatus? status,
    InputField? mobile,
    InputField? password,
  }) {
    LoginFormStatus newStatus = status ?? this.status;
    InputField newMobile = mobile ?? this.mobile;
    InputField newPassword = password ?? this.password;

    newMobile = newMobile.copyWith(error: newStatus.getError('mobile'));
    newPassword = newPassword.copyWith(error: newStatus.getError('password'));
    if (newMobile.valid &&
        newPassword.valid &&
        newStatus.formStatus == FormStatus.initial) {
      newStatus = newStatus.copyWith(formStatus: FormStatus.valid);
    } else if (!newMobile.valid ||
        !newPassword.valid && newStatus.formStatus == FormStatus.valid) {
      newStatus = newStatus.copyWith(formStatus: FormStatus.initial);
    }
    return LoginState(
      status: newStatus,
      mobile: newMobile,
      password: newPassword,
    );
  }

  @override
  List<Object> get props => [status, mobile, password];

  @override
  String toString() {
    return '''{status: ${status.toString()}, mobile: ${mobile.toString()}, password: ${password.toString()}}''';
  }
}

class InputField extends Equatable {
  const InputField._({required this.value, this.error});

  const InputField.empty() : this._(value: '', error: null);
  const InputField.value(String value) : this._(value: value, error: null);
  const InputField.error(String value, {String? error})
      : this._(value: value, error: error);

  final String value;
  final String? error;

  InputField copyWith({
    String? value,
    String? error,
  }) {
    return InputField._(
      value: value ?? this.value,
      error: error ?? this.error,
    );
  }

  bool get valid => error == null && value.isNotEmpty;

  @override
  List<Object?> get props => [value, error];

  @override
  String toString() {
    return '''{value: $value, error: $error, valid: $valid}''';
  }
}
