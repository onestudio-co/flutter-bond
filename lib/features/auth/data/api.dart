import 'package:bond/features/auth/auth.dart';
import 'package:bond_core/core.dart';

import 'errors/validation_error.dart';

typedef UserApiResult = SingleMResponse<User, UserMeta>;

class AuthApi {
  final BondFire _bondFire;

  AuthApi(this._bondFire);

  Future<User> me() => _bondFire
      .get<User>('/users/me')
      .cache(cacheKey: 'user', cachePolicy: CachePolicy.cacheThenNetwork)
      .factory(User.fromJson)
      .errorFactory(ServerError.fromJson)
      .execute();

  Future<UserApiResult> anonymousLogin() => _bondFire
      .post<UserApiResult>('users/anonymous-login')
      .factory(UserApiResult.fromJson)
      .errorFactory(ServerError.fromJson)
      .cacheCustomKey('token', path: 'meta.token')
      .cacheCustomKey('user', path: 'data')
      .execute();

  Future<UserApiResult> login(Map<String, dynamic> body) => _bondFire
      .post<UserApiResult>('/users/login')
      .body(body)
      .factory(UserApiResult.fromJson)
      .errorFactory(ValidationError.fromJson)
      .cacheCustomKey('token', path: 'meta.token')
      .cacheCustomKey('user', path: 'data')
      .execute();

  Future<UserApiResult> register(Map<String, dynamic> body) => _bondFire
      .post<UserApiResult>('/users/register')
      .body(body)
      .factory(UserApiResult.fromJson)
      .errorFactory(ValidationError.fromJson)
      .cacheCustomKey('token', path: 'meta.token')
      .cacheCustomKey('user', path: 'data')
      .execute();

  Future<SuccessResponse> logout() => _bondFire
      .post<SuccessResponse>('/users/logout')
      .factory(SuccessResponse.fromJson)
      .errorFactory(ServerError.fromJson)
      .execute();

  Future<SuccessResponse> updateToken(Map<String, dynamic> body) => _bondFire
      .post<SuccessResponse>('notifications/update-token')
      .body(body)
      .factory(SuccessResponse.fromJson)
      .errorFactory(ServerError.fromJson)
      .execute();
}
