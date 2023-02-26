import 'package:bond/features/auth/auth.dart';
import 'package:bond/features/auth/data/datasource/auth_http_client.dart';
import 'package:bond/features/auth/data/dto/user_dto.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_studio_core/core.dart';

final loginRequestProvider = StateNotifierProvider<LoginRequestProvider,
    AsyncValue<SingleMResponse<User, UserMeta>?>>((ref) {
  return LoginRequestProvider(sl(), sl());
});

class LoginRequestProvider
    extends StateNotifier<AsyncValue<SingleMResponse<User, UserMeta>?>> {
  final AuthHttpClient _authHttpClient;
  final AuthStore<User> _localDataSource;

  LoginRequestProvider(this._authHttpClient, this._localDataSource)
      : super(const AsyncValue.data(null));

  void login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final response = await _authHttpClient.login(
        UserDto(
          email: email,
          password: password,
        ).body,
      );
      state = AsyncData(response);
      _localDataSource.user = response.data;
      _localDataSource.token = response.meta.token;
    } on ServerException catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
