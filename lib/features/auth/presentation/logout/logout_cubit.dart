import 'package:bloc/bloc.dart';
import 'package:bond/features/auth/data/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this._authRepository) : super(LogoutInitial());

  final AuthRepository _authRepository;

  void logout() async {
    emit(const LogoutLoading());
    final response = await _authRepository.logout();
    emit(
      response.fold(
        (failure) => LogoutFailed(failure.toMessage()),
        (response) => LogoutSuccess(response.message),
      ),
    );
  }
}
