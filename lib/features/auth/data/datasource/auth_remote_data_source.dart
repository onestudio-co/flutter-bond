import 'package:bond/features/auth/data/dto/user_dto.dart';
import 'package:bond/features/auth/data/models/user.dart';
import 'package:bond/features/auth/data/models/user_meta.dart';
import 'package:one_studio_core/core.dart';

class AuthRemoteDataSource extends DataSource {
  final ApiClient _client;

  AuthRemoteDataSource(this._client);

  Future<SingleMResponse<User, UserMeta>> anonymous() async =>
      mapSingleMResponse<User, UserMeta>(await _client.post(
        AuthApis.anonymousLogin,
        headers: Api.headers(),
      ));

  Future<SingleMResponse<User, UserMeta>> register(UserDto user) async =>
      mapSingleMResponse<User, UserMeta>(await _client.post(
        AuthApis.register,
        body: user.body,
        headers: Api.headers(),
      ));

  Future<SingleMResponse<User, UserMeta>> login(UserDto user) async =>
      mapSingleMResponse<User, UserMeta>(await _client.post(
        AuthApis.login,
        body: user.body,
        headers: Api.headers(),
      ));

  Future<SuccessResponse> logout() async => mapSuccessResponse(
        await _client.post(
          AuthApis.logout,
          headers: Api.headers(),
        ),
      );
}

extension AuthApis on Api {
  static String get anonymousLogin => 'users/anonymous-login';

  static String get register => 'users/register';

  static String get login => 'users/login';

  static String get logout => 'users/logout';
}
