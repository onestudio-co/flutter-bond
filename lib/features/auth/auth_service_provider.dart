import 'package:get_it/get_it.dart';
import 'package:one_studio_core/core.dart';

import 'data/datasources/auth_local_data_source.dart';
import 'data/datasources/auth_remote_data_source.dart';
import 'data/models/user.dart';
import 'data/models/user_meta.dart';
import 'data/repositories/auth_repository.dart';
import 'presentation/login/login_bloc.dart';
import 'presentation/logout/logout_cubit.dart';
import 'presentation/register/register_bloc.dart';

class AuthServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    it.registerFactory(() => AuthRemoteDataSource(it()));
    it.registerLazySingleton<AuthStore>(() => AuthLocalDataSource(it()));

    it.registerLazySingleton(() => AuthRepository(it(), it()));

    it.registerFactory(() => LoginBloc(it()));

    it.registerFactory(() => RegisterBloc(it()));

    it.registerFactory(() => LogoutCubit(it()));
  }

  @override
  T? responseConvert<T>(Map<String, dynamic> json) {
    switch (T) {
      case User:
        return User.fromJson(json) as T;
      case UserMeta:
        return UserMeta.fromJson(json) as T;
      default:
        return null;
    }
  }
}

typedef ApiDrivenEvents = Map<String,
    Map<dynamic, AnalyticsEvent Function(Map<String, dynamic> json)>>;

typedef NavigationDrivenEvents = Map<String,
    Map<dynamic, AnalyticsEvent Function(Map<String, dynamic> json)>>;
