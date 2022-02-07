import 'package:fixit/core/shared_bloc_base.dart';

import '../../data/repositories/auth_repository.dart';
import 'register_state.dart';

class RegisterCubit extends SharedBlocBase<RegisterState> {
  final AuthRepository authenticationRepository;

  RegisterCubit(this.authenticationRepository) : super(InitialRegisterState());

  Future<void> registerPressed(
      {required String number,
      required String name,
      required String password,
      required String referralCode}) async {
    emit(const RegisterLoading());
    final response = await authenticationRepository.register(
      number,
      name,
      password,
      referralCode,
    );
    emit(response.fold(
      (failure) => RegisterFailed(error: toMessage(failure)),
      (response) => RegisterSuccess(user: response.data),
    ));
  }

  void hideError(String key) {
    emit(const RegisterLoading());
    clearKeyError(key);
    emit(RegisterFieldChangedSuccess(key: key));
  }
}
