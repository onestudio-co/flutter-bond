import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class ChangePasswordPressed extends AuthEvent {
  final String currentPassword;
  final String newPassword;
  final String confirmedPassword;

  const ChangePasswordPressed({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmedPassword,
  });

  @override
  List<Object> get props => [currentPassword, newPassword, confirmedPassword];
}

class LogoutPressed extends AuthEvent {
  final bool fromOther;

  const LogoutPressed({
    required this.fromOther,
  });

  @override
  List<Object> get props => [fromOther];
}

class FieldChanged extends AuthEvent {
  final String key;

  const FieldChanged({
    required this.key,
  });

  @override
  List<Object> get props => [key];
}
