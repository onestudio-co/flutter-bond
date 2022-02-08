import 'package:fixit/core/service_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    it.registerLazySingleton(() => sharedPreferences);

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    it.registerLazySingleton(() => packageInfo);
  }
}
