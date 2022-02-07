import 'dart:convert';

import 'package:equatable/equatable.dart';

class Model extends Equatable {
  final int id;

  const Model({
    required this.id,
  });

  @override
  List<Object> get props => [id];

  Map<String, dynamic> toJson() {
    return {};
  }

  String toJsonString() => json.encode(toJson());
}
