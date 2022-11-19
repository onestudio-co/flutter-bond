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
  AppBloc({
    required AuthLocalDataSource authLocalDataSource,
    required AppLocalDataSource appLocalDataSource,
  }) : super(
          AppState.initial(
            user: authLocalDataSource.user,
            currentLocale: appLocalDataSource.currentLocale,
            currentThemeMode: appLocalDataSource.currentThemeMode,
          ),
        ) {
    on<AppEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(AppEvent event, Emitter<AppState> emit) {}
}
