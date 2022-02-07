import 'package:fixit/features/auth/data/dto/social_account_user.dart';
import 'package:fixit/features/auth/data/repositories/auth_repository.dart';
import 'package:fixit/features/auth/data/services/apple_id_login_service.dart';

import '../social_account_login_cubit.dart';

class AppleIdLoginCubit extends SocialAccountLoginCubit {
  final AppleIdLoginService service;
  AppleIdLoginCubit(AuthRepository authenticationRepository, this.service)
      : super(authenticationRepository);

  @override
  Future<SocialAccountUser> socialLogin() => service.login();
}
