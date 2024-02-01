// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseData _$ApiResponseDataFromJson(Map<String, dynamic> json) =>
    ApiResponseData(
      after: json['after'] as String?,
      before: json['before'] as String?,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => ApiChildren.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ApiResponseDataToJson(ApiResponseData instance) =>
    <String, dynamic>{
      'after': instance.after,
      'before': instance.before,
      'children': instance.children,
    };
