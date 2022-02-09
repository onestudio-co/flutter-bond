import 'package:fixit/core/api_client.dart';
import 'package:fixit/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:fixit/injection_container.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mock_api_client.dart';

MockApiClient mockApiClient = MockApiClient();

Future mockSetup() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  sl.reset();
  await init();
  sl.registerLazySingleton<ApiClient>(() => mockApiClient);
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
