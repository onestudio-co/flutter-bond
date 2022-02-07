import 'package:equatable/equatable.dart';
import 'package:fixit/core/models/success_response.dart';

abstract class ResetPasswordState extends Equatable {
  const ResetPasswordState();
}

class InitialResetPasswordState extends ResetPasswordState {
  @override
  List<Object> get props => [];
}

class ResetPasswordLoading extends ResetPasswordState {
  @override
  List<Object> get props => [];
}

class ResetPasswordSuccess extends ResetPasswordState {
  final SuccessResponse response;

  const ResetPasswordSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

class ResetPasswordFailed extends ResetPasswordState {
  final String error;
  final String? code;

  const ResetPasswordFailed({required this.error, this.code});

  @override
  String toString() {
    return "${super.toString()} ... $error";
  }

  @override
  List<Object> get props => [error, code ?? ''];
}

class ResetPasswordFieldChangedSuccess extends ResetPasswordState {
  final String key;

  const ResetPasswordFieldChangedSuccess({
    required this.key,
  });

  @override
  List<Object> get props => [key];
}
