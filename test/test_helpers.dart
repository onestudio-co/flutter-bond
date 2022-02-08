import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fixit/core/api_client.dart';
import 'package:fixit/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:fixit/injection_container.dart';
import 'package:flutter/services.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockApiClient extends Mock implements ApiClient {}
MockApiClient mockApiClient = MockApiClient();

Future mockSetup() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  SharedPreferences.setMockInitialValues({
    AuthLocalDataSource.cachedToken: "123",
  });

  FlutterConfig.loadValueForTesting({
    "MAIN_URL" : "http://example.com/api/v2/"
  });

  sl.reset();
  await init();
  mockPackageInfo();
  sl.registerLazySingleton<ApiClient>(() => mockApiClient);
}

void mockPackageInfo() {
  const channel = MethodChannel('plugins.flutter.io/package_info');

  handler(MethodCall methodCall) async {
    if (methodCall.method == 'getAll') {
      return {
        'appName': 'ABC',
        'packageName': 'A.B.C',
        'version': '1.0.0',
        'buildNumber': '',
      };
    }
    assert(false);
    return null;
  }

  var instance = TestDefaultBinaryMessengerBinding.instance;
  instance?.defaultBinaryMessenger.setMockMethodCallHandler(channel, handler);
}

void mockPost({
  required String url,
  required dynamic response,
  Map<String, dynamic>? body,
  Map<String, String>? headers,
  bool withoutUser = false,
  int status = 200,
}) {
  response = response is String ? response : response.toJsonString();

  when(mockApiClient.post(
    url,
    body: body ?? anyNamed("body"),
    headers: anyNamed("headers"),
  )).thenAnswer((_) async {
    return Response(
      data: status <= 204 ? json.decode(response) : response,
      statusCode: status,
      requestOptions: RequestOptions(path: ''),
    );
  });
}
