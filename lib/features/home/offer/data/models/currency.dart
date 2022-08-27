import 'package:json_annotation/json_annotation.dart';
import 'package:one_studio_core/core.dart';

part 'currency.g.dart';

@JsonSerializable()
class Currency extends Model {
  final String name;

  const Currency({
    required int id,
    required this.name,
  }) : super(id: id);

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CurrencyToJson(this);
}
