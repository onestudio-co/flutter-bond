import 'package:famcare/core/shared_bloc_base.dart';
import 'package:famcare/features/auth/data/repositories/auth_repository.dart';

import 'forget_password_state.dart';

class ForgetPasswordCubit extends SharedBlocBase<ForgetPasswordState> {
  final AuthRepository authenticationRepository;

  ForgetPasswordCubit(this.authenticationRepository)
      : super(InitialForgetPasswordState());

  Future<void> forgetPressed({required String mobile}) async {
    emit(const ForgetPasswordLoading());
    final response = await authenticationRepository.forget(mobile);
    emit(response.fold(
      (failure) => ForgetPasswordFailed(error: toMessage(failure)),
      (response) => ForgetPasswordSuccess(response: response),
    ));
  }

  void hideError(String key) {
    emit(const ForgetPasswordLoading());
    clearKeyError(key);
    emit(ForgetPasswordFieldChangedSuccess(key: key));
  }
}
