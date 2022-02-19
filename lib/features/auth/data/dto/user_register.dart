class UserDto {
  final String userName;
  final String email;
  final String password;
  final String mobile;
  const UserDto({
    required this.userName,
    required this.email,
    required this.password,
    required this.mobile,
  });

  Map<String, dynamic> get body => {
        'username': userName,
        'email': email,
        'password': password,
        'mobile': mobile,
      };
}
