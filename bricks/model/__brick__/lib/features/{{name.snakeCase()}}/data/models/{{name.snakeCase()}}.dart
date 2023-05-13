{{#j}}import 'package:json_annotation/json_annotation.dart';
import 'package:one_studio_core/core.dart';

part '{{name.snakeCase()}}.g.dart';

@JsonSerializable()
{{/j}}class {{name.pascalCase()}} {{#j}}with Jsonable {{/j}}{
  final int id;

  const {{name.pascalCase()}}({
    required this.id,
  });
{{#j}}
  factory {{name.pascalCase()}}.fromJson(Map<String, dynamic> json) => _${{name.pascalCase()}}FromJson(json);

  @override
  Map<String, dynamic> toJson() => _${{name.pascalCase()}}ToJson(this);
{{/j}}}
