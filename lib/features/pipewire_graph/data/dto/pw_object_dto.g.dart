// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pw_object_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PwObjectDto _$PwObjectDtoFromJson(Map<String, dynamic> json) => _PwObjectDto(
  id: (json['id'] as num).toInt(),
  type: json['type'] as String,
  info: json['info'] as Map<String, dynamic>?,
  props: json['props'] as Map<String, dynamic>?,
  metadata: (json['metadata'] as List<dynamic>?)
      ?.map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic> _$PwObjectDtoToJson(_PwObjectDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'info': instance.info,
      'props': instance.props,
      'metadata': instance.metadata,
    };
