import 'package:bond/features/app/app_bloc.dart';
import 'package:bond/features/app/data/app_local_data_source.dart';
import 'package:get_it/get_it.dart';
import 'package:one_studio_core/core.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/app_router.dart';

class AppServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    it.registerLazySingleton(() => sharedPreferences);

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    it.registerLazySingleton(() => packageInfo);

    it.registerLazySingleton(() => AppRouter(AuthGuard()));

    it.registerLazySingleton(
      () => AppLocalDataSource(sharedPreferences: sharedPreferences),
    );

    it.registerFactory(() => AppBloc(it()));
  }
}
