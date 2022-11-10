// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceModel _$ResourceModelFromJson(Map<String, dynamic> json) =>
    ResourceModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResourceModelToJson(ResourceModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      statusCode: $enumDecodeNullable(_$StatusCodeEnumMap, json['statusCode']),
      id: json['id'] as int?,
      name: json['name'] as String?,
      year: _fetchJson(json['year']),
      color: json['color'] as String?,
      pantoneValue: json['pantoneValue'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'year': instance.year,
      'color': instance.color,
      'statusCode': _$StatusCodeEnumMap[instance.statusCode],
      'pantoneValue': instance.pantoneValue,
    };

const _$StatusCodeEnumMap = {
  StatusCode.success: 200,
  StatusCode.warning: 500,
};
