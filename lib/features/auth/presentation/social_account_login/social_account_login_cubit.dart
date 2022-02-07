import 'package:fixit/core/shared_bloc_base.dart';
import 'package:fixit/features/auth/data/dto/social_account_user.dart';
import 'package:fixit/features/auth/data/repositories/auth_repository.dart';

import 'social_account_login_state.dart';

abstract class SocialAccountLoginCubit
    extends SharedBlocBase<SocialAccountLoginState> {
  final AuthRepository authenticationRepository;

  SocialAccountLoginCubit(this.authenticationRepository)
      : super(InitialSocialAccountLoginState());

  Future<void> login() async {
    try {
      final socialAccountUser = await socialLogin();
      emit(SocialAccountLoginLoading());
      final response = await authenticationRepository.loginWithSocial(
          user: socialAccountUser);
      emit(response.fold(
        (failure) => SocialAccountLoginFailed(error: toMessage(failure)),
        (response) => SocialAccountLoginSuccess(
            user: response.data, channel: socialAccountUser.provider),
      ));
    } catch (error) {
      emit(SocialAccountLoginFailed(
          error:
              '${error.toString()}هناك خطا في عملية اللوجن، حاول مرة اخرى.'));
    }
  }

  Future<SocialAccountUser> socialLogin();
}
