import 'package:fixit/core/shared_bloc_base.dart';
import 'package:fixit/features/auth/data/repositories/auth_repository.dart';
import 'package:fixit/features/auth/presentation/activation/activation_state.dart';

class ActivationCubit extends SharedBlocBase<ActivationState> {
  final AuthRepository authenticationRepository;

  ActivationCubit(this.authenticationRepository)
      : super(InitialActivationState());

  Future<void> activatePressed(
      {required String mobile, required String code}) async {
    emit(ActivationLoading());
    final response = await authenticationRepository.activation(
      mobile,
      code,
    );
    emit(response.fold(
      (failure) => ActivationFailed(error: toMessage(failure), code: ''),
      (response) {
        return ActivationSuccess(user: response.data);
      },
    ));
  }

  Future<void> resendCodePressed({required String mobile}) async {
    emit(ActivationLoading());
    final response = await authenticationRepository.resend(mobile);
    response.fold(
      (failure) => emit(ActivationFailed(error: toMessage(failure))),
      (response) => emit(InitialActivationState()),
    );
  }

  void hideError(String key) {
    emit(ActivationLoading());
    clearKeyError(key);
    emit(ActivationFieldChangedSuccess(key: key));
  }
}
