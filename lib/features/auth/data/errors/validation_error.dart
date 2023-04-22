import 'package:json_annotation/json_annotation.dart';

part 'validation_error.g.dart';

@JsonSerializable()
class ValidationError extends Error {
  final String message;
  final Map<String, List<String>> errors;

  ValidationError({required this.message, required this.errors});

  factory ValidationError.fromJson(Map<String, dynamic> json) =>
      _$ValidationErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ValidationErrorToJson(this);

  List<String>? getFieldErrors(String field) => errors[field];
}
