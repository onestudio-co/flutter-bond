part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

class ChangeThemeEvent extends AppEvent {
  final ThemeMode themeMode;

  const ChangeThemeEvent(this.themeMode);

  @override
  List<Object?> get props => [themeMode];
}

class ChangeLocaleEvent extends AppEvent {
  final Locale locale;

  const ChangeLocaleEvent(this.locale);

  @override
  List<Object?> get props => [locale];
}
