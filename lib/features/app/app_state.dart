part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState({
    required this.currentLocale,
    required this.currentThemeMode,
  });

  final Locale currentLocale;
  final ThemeMode currentThemeMode;

  factory AppState.initial({
    final User? user,
    required Locale currentLocale,
    required ThemeMode currentThemeMode,
  }) =>
      AppState(
        currentLocale: currentLocale,
        currentThemeMode: currentThemeMode,
      );

  @override
  List<Object?> get props => [
        currentLocale.languageCode,
        currentThemeMode,
      ];

  AppState copyWith({
    Locale? currentLocale,
    ThemeMode? currentThemeMode,
  }) {
    return AppState(
      currentLocale: currentLocale ?? this.currentLocale,
      currentThemeMode: currentThemeMode ?? this.currentThemeMode,
    );
  }
}
