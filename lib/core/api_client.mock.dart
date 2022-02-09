import 'dart:async' as _i4;
import 'dart:convert' as _i5;

import 'package:dio/dio.dart' as _i2;
import 'package:fixit/core/api_client.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeDio_0 extends _i1.Fake implements _i2.Dio {}

class _FakeResponse_1<T> extends _i1.Fake implements _i2.Response<T> {}

/// A class which mocks [ApiClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiClient extends _i1.Mock implements _i3.ApiClient {
  MockApiClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Dio get client =>
      (super.noSuchMethod(Invocation.getter(#client), returnValue: _FakeDio_0())
          as _i2.Dio);

  @override
  _i4.Future<_i2.Response<dynamic>> get(dynamic url,
          {Map<String, String>? headers, dynamic queryParameters}) =>
      (super.noSuchMethod(
              Invocation.method(#get, [url],
                  {#headers: headers, #queryParameters: queryParameters}),
              returnValue: Future<_i2.Response<dynamic>>.value(
                  _FakeResponse_1<dynamic>()))
          as _i4.Future<_i2.Response<dynamic>>);

  @override
  _i4.Future<_i2.Response<dynamic>> post(url,
          {Map<String, String>? headers, body}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url], {#headers: headers, #body: body}),
              returnValue: Future<_i2.Response<dynamic>>.value(
                  _FakeResponse_1<dynamic>()))
          as _i4.Future<_i2.Response<dynamic>>);

  @override
  _i4.Future<_i2.Response<dynamic>> put(dynamic url,
          {Map<String, dynamic>? headers,
          dynamic body,
          _i5.Encoding? encoding,
          dynamic onSendProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [
                url
              ], {
                #headers: headers,
                #body: body,
                #encoding: encoding,
                #onSendProgress: onSendProgress
              }),
              returnValue: Future<_i2.Response<dynamic>>.value(
                  _FakeResponse_1<dynamic>()))
          as _i4.Future<_i2.Response<dynamic>>);
}
