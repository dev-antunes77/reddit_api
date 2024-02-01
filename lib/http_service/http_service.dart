import 'dart:convert';
import 'package:http/http.dart' as http;

abstract interface class ApiService {
  Future<ApiServiceResponse> get(String url);
}

final class HttpConnection implements ApiService {
  @override
  Future<ApiServiceResponse> get(String url) async => http
      .get(Uri.parse(url))
      .then((response) => ApiServiceResponse(response.body));
}

final class ApiServiceResponse {
  ApiServiceResponse(this.body);

  final String body;
  Map<String, dynamic> get json => jsonDecode(body);
}
