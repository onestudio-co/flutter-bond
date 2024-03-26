import 'package:bond/features/app/app_bloc.dart';
import 'package:bond/features/app/data/app_local_data_source.dart';
import 'package:bond/features/update_app/data/update_app_service.dart';
import 'package:bond_core/bond_core.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    it.registerLazySingleton(() => sharedPreferences);

    it.registerLazySingleton(
      () => AppLocalDataSource(sharedPreferences: sharedPreferences),
    );

    it.registerFactory(() => AppBloc(it()));
    if (!kIsWeb) {
      it.registerSingleton(
        UpdateAppService(remoteConfig: it(), packageInfo: it())..call(),
      );
    }
  }
}
