import 'package:fixit/core/shared_bloc_base.dart';
import 'package:fixit/features/auth/data/repositories/auth_repository.dart';

import 'reset_password_state.dart';

class ResetPasswordCubit extends SharedBlocBase<ResetPasswordState> {
  final AuthRepository authenticationRepository;

  ResetPasswordCubit(this.authenticationRepository)
      : super(InitialResetPasswordState());

  Future<void> resetPasswordPressed(
      {required String mobile,
      required String newPassword,
      required String confirmedPassword,
      required String code}) async {
    emit(ResetPasswordLoading());
    final response = await authenticationRepository.resetPassword(
      mobile,
      newPassword,
      confirmedPassword,
      code,
    );
    emit(response.fold(
      (failure) => ResetPasswordFailed(error: toMessage(failure)),
      (response) => ResetPasswordSuccess(response: response),
    ));
  }

  void hideError(String key) {
    emit(ResetPasswordLoading());
    clearKeyError(key);
    emit(ResetPasswordFieldChangedSuccess(key: key));
  }
}
