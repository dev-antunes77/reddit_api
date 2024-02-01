import 'package:api_mock/repository/models/api_response_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_main_response.g.dart';

@JsonSerializable()
final class ApiMainResponse {
  ApiMainResponse({
    required this.kind,
    required this.data,
  });

  factory ApiMainResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiMainResponseFromJson(json);
  final String kind;
  final ApiResponseData data;

  Map<String, dynamic> toJson() => _$ApiMainResponseToJson(this);
}
