import 'package:one_studio_core/core.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:taleb/config/api.dart';

import '../routes/app_router.dart';
import '../routes/guards/auth_guard.dart';

class AppServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    it.registerSingleton(
      () => Dio(
        BaseOptions(
          connectTimeout: 100 * 1000,
          sendTimeout: 1000 * 1000,
          receiveTimeout: 1000 * 1000,
          receiveDataWhenStatusError: true,
          baseUrl: ApiConfig.baseUrl,
        ),
      )..interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            compact: false,
          ),
        ),
    );
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    it.registerLazySingleton(() => sharedPreferences);

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    it.registerLazySingleton(() => packageInfo);

    it.registerLazySingleton(() => AppRouter(AuthGuard()));
  }
}
