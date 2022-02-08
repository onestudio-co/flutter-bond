import 'package:dio/dio.dart';
import 'package:fixit/core/api_client.dart';
import 'package:fixit/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:fixit/injection_container.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mock_api_client.dart';

MockApiClient mockApiClient = MockApiClient();

Future mockSetup() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  SharedPreferences.setMockInitialValues({
    AuthLocalDataSource.cachedToken: "123",
  });

  FlutterConfig.loadValueForTesting({
    "API_BASE_URL": "http://example.com/api/v2/",
  });

  PackageInfo.setMockInitialValues(
    appName: "ABC",
    packageName: "A.B.C",
    version: "1.0.0",
    buildNumber: "10",
    buildSignature: "buildSignature",
  );

  sl.reset();
  await init();
  sl.registerLazySingleton<ApiClient>(() => mockApiClient);
}

void mockPost(
  String url,
  dynamic data, {
  Map<String, dynamic>? body,
  Map<String, String>? headers,
  int statusCode = 200,
}) {
  when(mockApiClient.post(
    url,
    body: body ?? anyNamed("body"),
    headers: headers ?? anyNamed("headers"),
  )).thenAnswer((_) async {
    return Response(
      data: data,
      statusCode: statusCode,
      requestOptions: RequestOptions(path: ''),
    );
  });
}
