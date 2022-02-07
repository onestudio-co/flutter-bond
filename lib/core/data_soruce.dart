import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'errors/exceptions.dart';
import 'models/list_response.dart';
import 'models/single_m_response.dart';
import 'models/single_response.dart';
import 'models/success_response.dart';

class DataSource {
  SingleMResponse<T, G?>
      mapSingleMResponse<T extends Equatable, G extends Equatable?>(
          Response response) {
    if ((response.statusCode ?? 0) <= 204) {
      return SingleMResponse<T, G?>.fromResponse(response.data);
    } else {
      throw ServerException.fromResponse(response.data);
    }
  }

  SingleResponse<T> mapSingleResponse<T extends Equatable>(
      Response<dynamic> response) {
    if ((response.statusCode ?? 0) <= 204) {
      return SingleResponse<T>.fromResponse(response.data);
    } else {
      throw ServerException.fromResponse(response.data);
    }
  }

  ListResponse<T> mapListResponse<T extends Equatable>(
      Response<dynamic> response) {
    if ((response.statusCode ?? 0) <= 204) {
      return ListResponse<T>.fromResponse(response.data);
    } else {
      throw ServerException.fromResponse(response.data);
    }
  }

  SuccessResponse mapSuccessResponse(Response response) {
    if ((response.statusCode ?? 0) <= 204) {
      return SuccessResponse.fromResponse(response.data);
    } else {
      throw ServerException.fromResponse(response.data);
    }
  }
}
