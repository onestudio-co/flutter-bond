import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'errors/exceptions.dart';

class ApiClient {
  static var logoutFromInterceptors = false;
  final Dio client;

  ApiClient(this.client);

  Future<Response> get(url,
      {required Map<String, String> headers, queryParameters}) async {
    ApiClient.logoutFromInterceptors = false;
    debugPrint(url);
    try {
      return await client.get(url,
          queryParameters: queryParameters,
          options: Options(
            headers: headers,
          ));
    } on DioError catch (e) {
      debugPrint(e.message);
      if (e.response != null && e.response!.data != null) {
        throw ServerException(
            errors: e.response!.data, statusCode: e.response?.statusCode);
      }
      throw ServerException(
          errors: {"message": "$e"}, statusCode: e.response?.statusCode);
    } catch (e) {
      debugPrint(e.toString());
      throw ServerException(errors: {"message": "$e"});
    }
  }

  Future<Response> post(url,
      {required Map<String, String> headers, body, Encoding? encoding}) async {
    ApiClient.logoutFromInterceptors = false;

    debugPrint('post url $url');
    try {
      return await client.post(url,
          data: body,
          options: Options(
            headers: headers,
          ));
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != null) {
        throw ServerException(
            errors: e.response!.data, statusCode: e.response?.statusCode);
      }
      throw ServerException(
          errors: {"message": "$e"}, statusCode: e.response?.statusCode);
    } catch (e) {
      throw ServerException(errors: {"message": "$e"});
    }
  }

  Future<Response> put(url,
      {required Map<String, dynamic> headers,
      body,
      Encoding? encoding,
      onSendProgress}) async {
    ApiClient.logoutFromInterceptors = false;

    try {
      return await client.put(url,
          data: body,
          options: Options(headers: headers),
          onSendProgress: onSendProgress);
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != null) {
        throw ServerException(
            errors: e.response!.data, statusCode: e.response?.statusCode);
      }
      throw ServerException(
          errors: {"message": "$e"}, statusCode: e.response?.statusCode);
    } catch (e) {
      throw ServerException(errors: {"message": "$e"});
    }
  }
}
