import 'package:equatable/equatable.dart';
import 'package:fixit/features/auth/data/models/user.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class InitialLoginState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {
  final User user;

  const LoginSuccess({required this.user});

  @override
  List<Object> get props => [user];
}

class LoginFailed extends LoginState {
  final String error;
  final String? code;

  const LoginFailed({required this.error, this.code});

  @override
  String toString() {
    return "${super.toString()} ... $error";
  }

  @override
  List<Object> get props => [error, code ?? ''];
}

class LoginWithSocialSuccess extends LoginState {
  final User user;
  final String channel;

  const LoginWithSocialSuccess({required this.user, required this.channel});

  @override
  List<Object> get props => [user, channel];
}

class LoginWithSocialLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginWithSocialFailed extends LoginState {
  final String error;
  final String code;

  const LoginWithSocialFailed({required this.error, required this.code});

  @override
  String toString() {
    return "${super.toString()} ... $error";
  }

  @override
  List<Object> get props => [error, code];
}

class LoginFieldChangedSuccess extends LoginState {
  final String key;

  const LoginFieldChangedSuccess({
    required this.key,
  });

  @override
  List<Object> get props => [key];
}
