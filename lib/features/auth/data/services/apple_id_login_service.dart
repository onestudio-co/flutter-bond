import 'dart:convert';

import 'package:fixit/features/auth/data/dto/social_account_user.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleIdLoginService {
  AuthorizationCredentialAppleID? _appleID;
  String? _encryptedEmail;

  Future<SocialAccountUser> login() async {
    _appleID = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    final bool isValidAppleId = _appleID != null &&
        _appleID?.identityToken != null &&
        _appleID?.identityToken != null &&
        _appleID?.userIdentifier != null;
    if (isValidAppleId) {
      final AuthorizationCredentialAppleID appleID = _appleID!;
      final String email = appleID.email!;
      final String identityToken = appleID.identityToken!;
      final String userIdentifier = appleID.userIdentifier!;
      _encryptedEmail = json.decode(utf8.decode(base64
          .decode(base64.normalize(identityToken.split('.')[1]))))['email'];
      final socialAccountUser = SocialAccountUser(
          email: _encryptedEmail ?? email,
          provider: 'apple',
          providerId: userIdentifier,
          token: identityToken);
      return socialAccountUser;
    } else {
      return Future.error('invalid id');
    }
  }
}
