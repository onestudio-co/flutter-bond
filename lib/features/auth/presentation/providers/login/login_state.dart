part of 'login_provider.dart';

class LoginState {
  final String? email;
  final String? password;
  final bool obscured;
  final bool loading;
  final String? error;
  final Map<String, List<String>> apiErrors;

  LoginState({
    this.email,
    this.password,
    required this.obscured,
    required this.loading,
    this.error,
    this.apiErrors = const {},
  });

  factory LoginState.defaults() => LoginState(
        email: null,
        password: null,
        obscured: true,
        loading: false,
        error: null,
        apiErrors: {},
      );

  LoginState updateEmail(String email) => copyWith(email: email);

  LoginState updatePassword(String password) => copyWith(password: password);

  LoginState toggleObscured() => copyWith(obscured: !obscured);

  LoginState updateLoading(bool loading) => copyWith(loading: loading);

  LoginState updateError(String? error) => copyWith(error: error);

  LoginState resetError() => copyWith(error: null, resetError: true);

  LoginState updateValidationErrors(Map<String, List<String>> apiErrors) =>
      copyWith(apiErrors: apiErrors);

  String? get emailError {
    if (email == null) {
      return null;
    }
    if (apiErrors['email'] != null) {
      return apiErrors['email']!.join(', ');
    }
    if (!Validator.isEmailValid(email!)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? get passwordError {
    if (password == null) {
      return null;
    }
    if (apiErrors['password'] != null) {
      return apiErrors['password']!.join(', ');
    }
    if (!Validator.isPasswordValid(password!)) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  bool get isValid =>
      Validator.isEmailValid(email ?? '') &&
      Validator.isPasswordValid(password ?? '');

  LoginState copyWith({
    String? email,
    String? password,
    bool? obscured,
    bool? loading,
    String? error,
    Map<String, List<String>>? apiErrors,
    bool resetError = false, // Add resetError parameter
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      obscured: obscured ?? this.obscured,
      loading: loading ?? this.loading,
      error: resetError ? null : error ?? this.error,
      apiErrors: apiErrors ?? this.apiErrors,
    );
  }
}
