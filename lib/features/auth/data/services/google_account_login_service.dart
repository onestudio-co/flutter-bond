import 'package:google_sign_in/google_sign_in.dart';

import '../dto/social_account_user.dart';

class GoogleAccountLoginService {
  GoogleSignInAccount? _currentUser;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );
  GoogleSignInAuthentication? _googleSignInAuthentication;

  Future<SocialAccountUser> login() async {
    _currentUser = await _googleSignIn.signIn();
    _googleSignInAuthentication = await _currentUser?.authentication;
    final bool isValidAuthentication = _googleSignInAuthentication != null &&
        _googleSignInAuthentication?.accessToken != null &&
        _currentUser != null &&
        _currentUser?.email != null &&
        _currentUser?.id != null;
    if (isValidAuthentication) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          _googleSignInAuthentication!;
      final GoogleSignInAccount currentUser = _currentUser!;
      final String accessToken = googleSignInAuthentication.accessToken!;
      final String email = currentUser.email;
      final String id = currentUser.id;
      final SocialAccountUser socialAccountUser = SocialAccountUser(
          email: email, provider: 'google', providerId: id, token: accessToken);
      return socialAccountUser;
    } else {
      return Future.error('invalid id');
    }
  }
}
