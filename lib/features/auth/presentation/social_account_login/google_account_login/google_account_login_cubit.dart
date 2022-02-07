import 'package:fixit/features/auth/data/dto/social_account_user.dart';
import 'package:fixit/features/auth/data/repositories/auth_repository.dart';
import 'package:fixit/features/auth/data/services/google_account_login_service.dart';
import 'package:fixit/features/auth/presentation/social_account_login/social_account_login_cubit.dart';

class GoogleAccountLoginCubit extends SocialAccountLoginCubit {
  final GoogleAccountLoginService service;
  GoogleAccountLoginCubit(AuthRepository authenticationRepository, this.service)
      : super(authenticationRepository);

  @override
  Future<SocialAccountUser> socialLogin() => service.login();
}
