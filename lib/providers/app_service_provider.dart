import 'package:bond/features/update_app/update_app_service.dart';
import 'package:bond/features/app/app_bloc.dart';
import 'package:bond/features/app/data/app_local_data_source.dart';
import 'package:get_it/get_it.dart';
import 'package:bond_core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/app_router.dart';

class AppServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    it.registerLazySingleton(() => sharedPreferences);

    it.registerLazySingleton(() => AppRouter(AuthGuard()));

    it.registerLazySingleton(
      () => AppLocalDataSource(sharedPreferences: sharedPreferences),
    );

    it.registerFactory(() => AppBloc(it()));

    it.registerSingleton(
      UpdateAppService(remoteConfig: it(), packageInfo: it())..call(),
    );
  }
}
