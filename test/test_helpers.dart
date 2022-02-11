import 'package:fixit/core/api_client.dart';
import 'package:fixit/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:fixit/injection_container.dart';
import 'package:fixit/routes/app_router.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'lib/features/auth/login_cubit_test.mocks.dart';
import 'mock_api_client.dart';

MockApiClient mockApiClient = MockApiClient();
MockAppRouter appRouter = MockAppRouter();

Future mockSetup() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  sl.reset();
  await init();
  sl.registerLazySingleton<ApiClient>(() => mockApiClient);
  sl.registerLazySingleton<AppRouter>(() => appRouter);
}

void mockSharedPreferences() {
  SharedPreferences.setMockInitialValues({
    AuthLocalDataSource.cachedToken: "123",
  });
}

void mockPackageInfo() {
  PackageInfo.setMockInitialValues(
    appName: "ABC",
    packageName: "A.B.C",
    version: "1.0.0",
    buildNumber: "10",
    buildSignature: "buildSignature",
  );
}
