import 'package:bond/features/auth/presentation/login/login_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:one_studio_core/core.dart';

import 'data/datasources/auth_local_data_source.dart';
import 'data/datasources/auth_remote_data_source.dart';
import 'data/events/sign_in_event.dart';
import 'data/events/sign_out_event.dart';
import 'data/events/sign_up_event.dart';
import 'data/models/user.dart';
import 'data/repositories/auth_repository.dart';
import 'presentation/register/register_bloc.dart';

class AuthServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    it.registerFactory(() => AuthRemoteDataSource(it()));

    it.registerLazySingleton<AuthStore>(() => AuthLocalDataSource(it()));
    it.registerLazySingleton(() => AuthRepository(it(), it()));

    it.registerFactory(() => LoginBloc(it()));

    it.registerFactory(() => RegisterBloc(it()));
  }

  @override
  T? responseConvert<T>(Map<String, dynamic> json) {
    switch (T) {
      case User:
        return User.fromJson(json) as T;
      default:
        return null;
    }
  }

  ApiDrivenEvents get apiDrivenEvents => {
        'api/login': {
          200: (json) => SignInEvent(userId: json['id'], channel: ''),
          'insufficient_amount': (json) => SignInEvent(userId: 0, channel: ''),
        },
        'api/signup': {
          200: (json) => SignUpEvent(userId: json['id'], channel: ''),
        },
        'api/logout': {
          200: (json) => SignOutEvent(),
        },
      };
}

typedef ApiDrivenEvents = Map<String,
    Map<dynamic, AnalyticsEvent Function(Map<String, dynamic> json)>>;

typedef NavigationDrivenEvents = Map<String,
    Map<dynamic, AnalyticsEvent Function(Map<String, dynamic> json)>>;
