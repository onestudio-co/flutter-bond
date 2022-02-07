class SocialAccountUser {
  final String email;
  final String provider;
  final String providerId;
  final String token;

  SocialAccountUser(
      {required this.email,
      required this.provider,
      required this.providerId,
      required this.token});
}
