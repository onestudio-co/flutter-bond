part of 'logout_cubit.dart';

abstract class LogoutState extends Equatable {
  const LogoutState();
}

class LogoutInitial extends LogoutState {
  @override
  List<Object> get props => [];
}

class LogoutSuccess extends LogoutState {
  final String message;

  const LogoutSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class LogoutLoading extends LogoutState {
  const LogoutLoading();

  @override
  List<Object> get props => [];
}

class LogoutFailed extends LogoutState {
  final String error;

  const LogoutFailed(this.error);

  @override
  List<Object> get props => [error];
}
