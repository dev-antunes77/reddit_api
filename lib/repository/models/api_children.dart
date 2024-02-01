import 'package:api_mock/repository/models/api_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_children.g.dart';

@JsonSerializable()
final class ApiChildren {
  ApiChildren({
    required this.kind,
    required this.data,
  });

  factory ApiChildren.fromJson(Map<String, dynamic> json) =>
      _$ApiChildrenFromJson(json);
  final String kind;
  final ApiDataModel data;

  Map<String, dynamic> toJson() => _$ApiChildrenToJson(this);
}
