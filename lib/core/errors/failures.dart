import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);

  @override
  List<Object> get props => [];

  String toMessage() {
    debugPrint("runtimeType: $runtimeType");
    return 'Server Failure';
  }
}

class ServerFailure extends Failure {
  const ServerFailure({required this.error, required this.code});

  final Map<String, dynamic> error;
  final int code;

  Map<String, dynamic> get errors => error['errors'];

  String? getErrors(String key) {
    return errors[key] != null
        ? (errors[key] as List<dynamic>).join(',')
        : null;
  }

  @override
  String toMessage() => error["message"] ?? "-";
}

class ConnectionFailure extends Failure {}
