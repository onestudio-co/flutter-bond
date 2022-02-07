import 'package:equatable/equatable.dart';
import 'package:fixit/features/auth/data/models/user.dart';

abstract class ActivationState extends Equatable {
  const ActivationState();
}

class InitialActivationState extends ActivationState {
  @override
  List<Object> get props => [];
}

class ActivationLoading extends ActivationState {
  @override
  List<Object> get props => [];
}

class ActivationSuccess extends ActivationState {
  final User user;

  const ActivationSuccess({required this.user});

  @override
  List<Object> get props => [user];
}

class ActivationFailed extends ActivationState {
  final String error;
  final String? code;

  const ActivationFailed({required this.error, this.code});

  @override
  String toString() {
    return "${super.toString()} ... $error";
  }

  @override
  List<Object> get props => [error, code ?? 0];
}

class ActivationFieldChangedSuccess extends ActivationState {
  final String key;

  const ActivationFieldChangedSuccess({
    required this.key,
  });

  @override
  List<Object> get props => [key];
}
