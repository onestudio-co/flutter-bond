import 'dart:convert';

import 'package:faker/faker.dart';

import '../errors/exceptions.dart';

class ServerExceptionFactory {
  static ServerException create({
    String? code,
    String? message,
    int? statusCode,
  }) {
    return ServerException.fromResponse(
        json.encode({
          'code': code ?? faker.randomGenerator.string(12),
          'message': message ?? faker.randomGenerator.string(24),
        }),
        statusCode ?? 403);
  }
}
