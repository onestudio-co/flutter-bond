class Validator {
  Validator._();

  static bool isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return password.length >= 6 ;
  }

  static bool isFullNameValid(String fullName) {
    return fullName.split(' ').length >= 2;
  }
}
