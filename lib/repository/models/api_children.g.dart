// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_children.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiChildren _$ApiChildrenFromJson(Map<String, dynamic> json) => ApiChildren(
      kind: json['kind'] as String,
      data: ApiDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiChildrenToJson(ApiChildren instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'data': instance.data,
    };
