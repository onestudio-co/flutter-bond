import 'package:equatable/equatable.dart';

import 'jsonable.dart';

abstract class Model extends Equatable with Jsonable {
  final int id;

  const Model({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
