part of 'register_provider.dart';

class RegisterState {
  final String? email;
  final String? name;
  final String? password;
  final String? passwordConfirmation;
  final bool obscured;
  final bool obscuredConfirm;
  final bool loading;
  final String? error;

  RegisterState(
      this.email,
      this.name,
      this.password,
      this.passwordConfirmation,
      this.obscured,
      this.obscuredConfirm,
      this.loading,
      this.error,
      );

  factory RegisterState.defaults() => RegisterState(
    null,
    null,
    null,
    null,
    true,
    true,
    false,
    null,
  );

  RegisterState updateEmail(String email) => copyWith(email: email);

  RegisterState updateName(String name) => copyWith(name: name);

  RegisterState updatePassword(String password) => copyWith(password: password);

  RegisterState updatePasswordConfirmation(String passwordConfirmation) =>
      copyWith(passwordConfirmation: passwordConfirmation);

  RegisterState toggleObscured() =>
      copyWith(obscured: !obscured);

  RegisterState toggleObscuredConfirm() =>
      copyWith( obscuredConfirm: !obscuredConfirm);

  RegisterState updateLoading(bool loading) => copyWith(loading: loading);

  String? get emailError {
    if (email == null) {
      return null;
    }
    if (!Validator.isEmailValid(email!)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? get nameError {
    if (name == null) {
      return null;
    }
    if (!Validator.isNameValid(name!)) {
      return 'Please enter a valid name';
    }
    return null;
  }

  String? get passwordError {
    if (password == null) {
      return null;
    }
    if (!Validator.isPasswordValid(password!)) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  String? get passwordConfirmationError {
    if (password == null || passwordConfirmation == null) {
      return null;
    }
    if (!Validator.isPasswordConfirmationValid(
      password!,
      passwordConfirmation!,
    )) {
      return 'Password confirmation must be the same as password';
    }
    return null;
  }

  bool get isValid =>
      Validator.isEmailValid(email ?? '') &&
          Validator.isNameValid(name ?? '') &&
          Validator.isPasswordValid(password ?? '') &&
          Validator.isPasswordConfirmationValid(
              password ?? '', passwordConfirmation ?? '');

  RegisterState copyWith({
    String? email,
    String? name,
    String? password,
    String? passwordConfirmation,
    bool? obscured,
    bool? obscuredConfirm,
    bool? loading,
    String? error,
  }) {
    return RegisterState(
      email ?? this.email,
      name ?? this.name,
      password ?? this.password,
      passwordConfirmation ?? this.passwordConfirmation,
      obscured ?? this.obscured,
      obscuredConfirm ?? this.obscuredConfirm,
      loading ?? this.loading,
      error ?? this.error,
    );
  }
}
