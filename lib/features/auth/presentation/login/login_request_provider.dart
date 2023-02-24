import 'package:bond/features/auth/auth.dart';
import 'package:bond/features/auth/data/datasource/auth_http_client.dart';
import 'package:bond/features/auth/data/dto/user_dto.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_studio_core/core.dart';

final loginRequestProvider = StateNotifierProvider<LoginRequestProvider,
    SingleMResponse<User, UserMeta>?>((ref) {
  return LoginRequestProvider(sl());
});

class LoginRequestProvider
    extends StateNotifier<SingleMResponse<User, UserMeta>?> {
  final AuthHttpClient _authHttpClient;

  LoginRequestProvider(this._authHttpClient) : super(null);

  Future<bool> login(String email, String password) async {
    final response = await _authHttpClient.login(
      UserDto(
        email: email,
        password: password,
      ).body,
    );
    state = response;
    return false;
  }
}
