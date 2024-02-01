// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_main_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiMainResponse _$ApiMainResponseFromJson(Map<String, dynamic> json) =>
    ApiMainResponse(
      kind: json['kind'] as String,
      data: ApiResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiMainResponseToJson(ApiMainResponse instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'data': instance.data,
    };
