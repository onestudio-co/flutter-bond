import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bond/features/app/data/app_local_data_source.dart';
import 'package:bond/features/app/data/auth_local_data_source.dart';
import 'package:bond/features/auth/data/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(
    this._authLocalDataSource,
    this._appLocalDataSource,
  ) : super(
          AppState.initial(
            user: _authLocalDataSource.user,
            currentLocale: _appLocalDataSource.currentLocale,
            currentThemeMode: _appLocalDataSource.currentThemeMode,
          ),
        ) {
    on<ChangeThemeEvent>(_onChangeThemeEvent);
    on<ChangeLocaleEvent>(_onChangeLocaleEvent);
  }

  final AuthLocalDataSource _authLocalDataSource;
  final AppLocalDataSource _appLocalDataSource;

  FutureOr<void> _onChangeThemeEvent(
      ChangeThemeEvent event, Emitter<AppState> emit) {
    _appLocalDataSource.currentThemeMode = event.themeMode;
    emit(state.copyWith(currentThemeMode: event.themeMode));
  }

  FutureOr<void> _onChangeLocaleEvent(
      ChangeLocaleEvent event, Emitter<AppState> emit) {
    _appLocalDataSource.currentLocale = event.locale;
    emit(state.copyWith(currentLocale: event.locale));
  }
}
