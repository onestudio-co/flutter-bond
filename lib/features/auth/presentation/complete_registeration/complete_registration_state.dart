import 'package:equatable/equatable.dart';
import 'package:fixit/features/auth/data/models/user.dart';

abstract class CompleteRegistrationState extends Equatable {}

class InitialCompleteRegistrationState extends CompleteRegistrationState {
  @override
  List<Object> get props => [];
}

class CompleteRegistrationLoading extends CompleteRegistrationState {
  @override
  List<Object> get props => [];
}

class CompleteRegistrationSuccess extends CompleteRegistrationState {
  final User user;

  CompleteRegistrationSuccess({required this.user});

  @override
  List<Object> get props => [user];
}

class CompleteRegistrationFailed extends CompleteRegistrationState {
  final String error;
  final String? code;

  CompleteRegistrationFailed({required this.error, this.code});

  @override
  String toString() {
    return "${super.toString()} ... $error";
  }

  @override
  List<Object> get props => [error, code ?? ''];
}

class CompleteRegistrationFieldChangedSuccess
    extends CompleteRegistrationState {
  final String key;

  CompleteRegistrationFieldChangedSuccess({
    required this.key,
  });

  @override
  List<Object> get props => [key];
}
