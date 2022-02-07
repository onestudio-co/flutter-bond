import 'package:equatable/equatable.dart';
import 'package:fixit/core/models/success_response.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class InitialAuthState extends AuthState {
  @override
  List<Object> get props => [];
}

class LogoutSuccess extends AuthState {
  const LogoutSuccess();

  @override
  List<Object> get props => [];
}

class FieldChangedSuccess extends AuthState {
  final String key;

  const FieldChangedSuccess({
    required this.key,
  });

  @override
  List<Object> get props => [key];
}

class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthFailed extends AuthState {
  final String error;
  final String? code;

  const AuthFailed({required this.error, this.code});

  @override
  String toString() {
    return "${super.toString()} ... $error";
  }

  @override
  List<Object> get props => [error, code ?? 0];
}

class ChangePasswordSuccess extends AuthState {
  final SuccessResponse response;

  const ChangePasswordSuccess({required this.response});

  @override
  List<Object> get props => [response];
}
