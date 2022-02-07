import 'package:fixit/core/shared_bloc_base.dart';

import '../../data/dto/complete_registration.dart';
import '../../data/repositories/auth_repository.dart';
import 'complete_registration_state.dart';

class CompleteRegistrationCubit
    extends SharedBlocBase<CompleteRegistrationState> {
  final AuthRepository authenticationRepository;

  CompleteRegistrationCubit(this.authenticationRepository)
      : super(InitialCompleteRegistrationState());

  Future<void> confirmPressed(
      {required CompleteRegistration completeRegistrationData}) async {
    emit(CompleteRegistrationLoading());
    final response = await authenticationRepository
        .completeRegistration(completeRegistrationData);
    emit(response.fold(
        (failure) => CompleteRegistrationFailed(error: toMessage(failure)),
        (response) => CompleteRegistrationSuccess(user: response.data)));
  }

  void hideError(String key) {
    emit(CompleteRegistrationLoading());
    clearKeyError(key);
    emit(CompleteRegistrationFieldChangedSuccess(key: key));
  }
}
