import 'package:json_annotation/json_annotation.dart';
import 'package:one_studio_core/core.dart';

part '{{name.snakeCase()}}.g.dart';

@JsonSerializable()
class {{name.pascalCase()}} with Jsonable {
  final int id;

  const {{name.pascalCase()}}({
    required this.id,
  });

  factory {{name.pascalCase()}}.fromJson(Map<String, dynamic> json) => _${{name.pascalCase()}}FromJson(json);

  @override
  Map<String, dynamic> toJson() => _${{name.pascalCase()}}ToJson(this);
}
