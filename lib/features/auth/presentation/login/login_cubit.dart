import 'package:fixit/core/shared_bloc_base.dart';

import '../../data/repositories/auth_repository.dart';
import 'login_state.dart';

class LoginCubit extends SharedBlocBase<LoginState> {
  final AuthRepository authenticationRepository;

  LoginCubit(this.authenticationRepository) : super(InitialLoginState());

  Future<void> loginPressed(
      {required String mobile, required String password}) async {
    emit(LoginLoading());
    final response = await authenticationRepository.login(
      mobile,
      password,
    );
    emit(response.fold(
      (failure) =>
          LoginFailed(error: toMessage(failure), code: toCode(failure)),
      (response) => LoginSuccess(user: response.data),
    ));
  }

  void hideError(String key) {
    emit(LoginLoading());
    clearKeyError(key);
    emit(LoginFieldChangedSuccess(key: key));
  }
}
