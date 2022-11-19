class UserDto {
  final String? name;
  final String email;
  final String password;
  final String? passwordConfirmation;

  UserDto({
    this.name,
    required this.email,
    required this.password,
    this.passwordConfirmation,
  });

  Map<String, dynamic> get body => {
        if (name != null) 'name': name,
        'email': email,
        'password': password,
        if (passwordConfirmation != null)
          'password_confirmation': passwordConfirmation,
      };
}
