import 'package:bloc/bloc.dart';
import 'package:bond/features/auth/data/datasource/auth_http_client.dart';
import 'package:equatable/equatable.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this._authHttpClient) : super(LogoutInitial());

  final AuthHttpClient _authHttpClient;

  void logout() async {
    emit(const LogoutLoading());
    final response = await _authHttpClient.logout();
    emit(LogoutSuccess(response.message));
  }
}
