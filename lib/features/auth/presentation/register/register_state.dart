import 'package:equatable/equatable.dart';
import 'package:fixit/features/auth/data/models/user.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class InitialRegisterState extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterLoading extends RegisterState {
  const RegisterLoading();

  @override
  List<Object> get props => [];
}

class RegisterSuccess extends RegisterState {
  final User user;

  const RegisterSuccess({required this.user});

  @override
  List<Object> get props => [user];
}

class RegisterFailed extends RegisterState {
  final String error;
  final String? code;

  const RegisterFailed({required this.error, this.code});

  @override
  String toString() {
    return "${super.toString()} ... $error";
  }

  @override
  List<Object> get props => [error, code ?? ''];
}

class RegisterFieldChangedSuccess extends RegisterState {
  final String key;

  const RegisterFieldChangedSuccess({
    required this.key,
  });

  @override
  List<Object> get props => [key];
}
