import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fixit/core/errors/failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/auth_repository.dart';
import 'bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authenticationRepository;

  AuthBloc(this.authenticationRepository) : super(InitialAuthState()) {
    on<LogoutPressed>(_logout);
    on<ChangePasswordPressed>(_changePassword);
    on<FieldChanged>(_fieldChanged);
  }

  Map<String, dynamic>? error = <String, dynamic>{};
  String code = "";
  String encryptedEmail = "";

  Future<FutureOr<void>> _logout(
      LogoutPressed event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final failureOrAuth = await authenticationRepository.logout(
      event.fromOther,
    );
    emit(failureOrAuth.fold(
      (failure) => AuthFailed(error: toMessage(failure)),
      (response) {
        return const LogoutSuccess();
      },
    ));
  }

  Future<FutureOr<void>> _changePassword(
      ChangePasswordPressed event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final response = await authenticationRepository.changePassword(
      event.currentPassword,
      event.newPassword,
      event.confirmedPassword,
    );
    emit(response.fold(
      (failure) => AuthFailed(error: toMessage(failure)),
      (response) => ChangePasswordSuccess(response: response),
    ));
  }

  FutureOr<void> _fieldChanged(FieldChanged event, Emitter<AuthState> emit) {
    emit(AuthLoading());
    clearKeyError(event.key);

    emit(FieldChangedSuccess(key: event.key));
  }

  clearKeyError(String key) {
    if (error != null && error?[key] != null) {
      error?.remove(key);
    }
  }

  toMessage(Failure failure) {
    if (failure is ServerFailure) {
      error = failure.error["errors"];
      if (failure.error["code"] != null) {
        code = failure.error["code"];
      }
    }

    return failure.toMessage();
  }

  String? getErrorAuthBloc(String key) {
    if (error == null) {
      return null;
    }
    if (error?[key] == null) {
      return null;
    } else {
      return error?[key].toString().replaceAll("[", " ").replaceAll("]", " ");
    }
  }

  void hideErrorAuthBloc(String key) {
    add(FieldChanged(key: key));
  }
}
