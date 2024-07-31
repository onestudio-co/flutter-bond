import 'package:bond/features/auth/auth.dart';
import 'package:bond_network/bond_network.dart';

import 'errors/validation_error.dart';

typedef UserMApiResult = SingleMResponse<User, UserMeta>;
typedef UserApiResult = SingleResponse<User>;

class AuthApi {
  final BondFire _bondFire;

  AuthApi(this._bondFire);

  Future<User> me() => _bondFire
      .get<User>('/users/me')
      .cache(cacheKey: 'user', cachePolicy: CachePolicy.cacheThenNetwork)
      .header(Api.headers())
      .factory(User.fromJson)
      .errorFactory(ServerError.fromJson)
      .execute();

  Future<UserMApiResult> login(Map<String, dynamic> body) => _bondFire
      .post<UserMApiResult>('/users/login')
      .body(body)
      .factory(UserMApiResult.fromJson)
      .errorFactory(ValidationError.fromJson)
      .cacheCustomKey('token', path: 'meta.token')
      .cacheCustomKey('user', path: 'data')
      .execute();

  Future<UserMApiResult> register(Map<String, dynamic> body) => _bondFire
      .post<UserMApiResult>('/users/register')
      .body(body)
      .factory(UserMApiResult.fromJson)
      .errorFactory(ValidationError.fromJson)
      .cacheCustomKey('token', path: 'meta.token')
      .cacheCustomKey('user', path: 'data')
      .execute();

  Future<SuccessResponse> logout() => _bondFire
      .post<SuccessResponse>('/users/logout')
      .header(Api.headers())
      .factory(SuccessResponse.fromJson)
      .errorFactory(ServerError.fromJson)
      .execute();
}
