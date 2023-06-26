class Validator {
  Validator._();

  static bool isNameValid(String name) => name.split(' ').length >= 2;

  static bool isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  static bool isPasswordValid(String password) => password.length >= 8;

  static bool isPasswordConfirmationValid(
    String password,
    String passwordConfirmation,
  ) =>
      password == passwordConfirmation;
}
