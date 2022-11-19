part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState({
    this.user,
    required this.currentLocale,
    required this.currentThemeMode,
  });

  final User? user;
  final Locale currentLocale;
  final ThemeMode currentThemeMode;

  factory AppState.initial({
    final User? user,
    required Locale currentLocale,
    required ThemeMode currentThemeMode,
  }) =>
      AppState(
        user: user,
        currentLocale: currentLocale,
        currentThemeMode: currentThemeMode,
      );

  @override
  List<Object?> get props => [
        user,
        currentLocale.languageCode,
        currentThemeMode,
      ];

  AppState copyWith({
    User? user,
    Locale? currentLocale,
    ThemeMode? currentThemeMode,
  }) {
    return AppState(
      user: user ?? this.user,
      currentLocale: currentLocale ?? this.currentLocale,
      currentThemeMode: currentThemeMode ?? this.currentThemeMode,
    );
  }
}
