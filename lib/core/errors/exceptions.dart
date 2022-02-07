import 'dart:convert';

import 'failures.dart';

class ServerException implements Exception {
  Map<String, dynamic> errors;
  int? statusCode;

  ServerException({required this.errors, this.statusCode});

  static fromResponse(String body, [int? statusCode]) {
    return ServerException(errors: json.decode(body), statusCode: statusCode);
  }

  Failure toFailure() => ServerFailure(error: errors, code: statusCode ?? 0);
}

class CacheException implements Exception {}
