import 'package:equatable/equatable.dart';
import 'package:fixit/core/models/success_response.dart';

abstract class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();
}

class InitialForgetPasswordState extends ForgetPasswordState {
  @override
  List<Object> get props => [];
}

class ForgetPasswordLoading extends ForgetPasswordState {
  const ForgetPasswordLoading();

  @override
  List<Object> get props => [];
}

class ForgetPasswordSuccess extends ForgetPasswordState {
  final SuccessResponse response;

  const ForgetPasswordSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

class ForgetPasswordFailed extends ForgetPasswordState {
  final String error;
  final String? code;

  const ForgetPasswordFailed({required this.error, this.code});

  @override
  String toString() {
    return "${super.toString()} ... $error";
  }

  @override
  List<Object> get props => [error, code ?? ''];
}

class ForgetPasswordFieldChangedSuccess extends ForgetPasswordState {
  final String key;

  const ForgetPasswordFieldChangedSuccess({
    required this.key,
  });

  @override
  List<Object> get props => [key];
}
