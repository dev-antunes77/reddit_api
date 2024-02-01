import 'package:api_mock/core/models/post_item.dart';
import 'package:api_mock/repository/models/api_children.dart';
import 'package:api_mock/repository/models/api_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_response_data.g.dart';

@JsonSerializable()
final class ApiResponseData {
  ApiResponseData({
    this.after,
    this.before,
    required this.children,
  });

  factory ApiResponseData.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseDataFromJson(json);
  final String? after;
  final String? before;
  final List<ApiChildren>? children;

  Map<String, dynamic> toJson() => _$ApiResponseDataToJson(this);

  List<ApiDataModel> get apiData =>
      children?.map((child) => child.data).toList() ?? [];

  List<PostItem> get apiDataList =>
      apiData.map((apiData) => apiData.toApiDataModel()).toList();
}
