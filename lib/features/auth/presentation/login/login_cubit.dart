import 'package:fixit/core/shared_bloc_base.dart';

import '../../data/repositories/auth_repository.dart';
import 'login_state.dart';

class LoginCubit extends SharedBlocBase<LoginState> {
  LoginCubit(this.authenticationRepository) : super(const LoginState.initial());

  final AuthRepository authenticationRepository;

  void loginMobileChanged(String mobile) {
    emit(state.copyWith(mobile: InputField.value(mobile)));
  }

  void loginPasswordChanged(String password) {
    emit(state.copyWith(password: InputField.value(password)));
  }

  Future<void> loginSubmitted() async {
    emit(state.copyWith(status: const LoginFormStatus.loading()));
    final response = await authenticationRepository.login(
      state.mobile.value,
      state.password.value,
    );
    final LoginFormStatus loginStatus = response.fold(
      (failure) => LoginFormStatus.failure(failure: failure),
      (response) => LoginFormStatus.success(user: response.data),
    );
    emit(state.copyWith(status: loginStatus));
  }
}
