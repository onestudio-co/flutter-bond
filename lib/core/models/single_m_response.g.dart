// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_m_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleMResponse<T, G>
    _$SingleMResponseFromJson<T extends Equatable, G extends Equatable>(
            Map<String, dynamic> json) =>
        SingleMResponse<T, G>(
          ResponseConverter<T>().fromJson(json['data'] as Object),
          ResponseConverter<G>().fromJson(json['meta'] as Object),
        );

Map<String, dynamic>
    _$SingleMResponseToJson<T extends Equatable, G extends Equatable>(
            SingleMResponse<T, G> instance) =>
        <String, dynamic>{
          'data': ResponseConverter<T>().toJson(instance.data),
          'meta': ResponseConverter<G>().toJson(instance.meta),
        };
