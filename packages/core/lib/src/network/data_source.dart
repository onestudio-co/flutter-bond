import 'dart:convert';

import 'package:dio/dio.dart';

import 'errors/exceptions.dart';
import 'models.dart';

class DataSource {
  SingleMResponse<T, G> mapSingleMResponse<T extends Model, G extends Model>(
      Response response) {
    if ((response.statusCode ?? 0) <= 204) {
      return SingleMResponse<T, G>.fromResponse(response.data);
    } else {
      throw ServerException.fromResponse(
          json.encode(response.data), response.statusCode);
    }
  }

  SingleResponse<T> mapSingleResponse<T extends Model>(
      Response<dynamic> response) {
    if ((response.statusCode ?? 0) <= 204) {
      return SingleResponse<T>.fromResponse(response.data);
    } else {
      throw ServerException.fromResponse(
          json.encode(response.data), response.statusCode);
    }
  }

  ListResponse<T> mapListResponse<T extends Model>(Response<dynamic> response) {
    if ((response.statusCode ?? 0) <= 204) {
      return ListResponse<T>.fromResponse(response.data);
    } else {
      throw ServerException.fromResponse(
          json.encode(response.data), response.statusCode);
    }
  }

  SuccessResponse mapSuccessResponse(Response response) {
    if ((response.statusCode ?? 0) <= 204) {
      return SuccessResponse.fromResponse(response.data);
    } else {
      throw ServerException.fromResponse(
          json.encode(response.data), response.statusCode);
    }
  }
}
