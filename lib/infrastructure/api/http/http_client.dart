import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:wordaction/infrastructure/api/http/http_client_base.dart';
import '../api_exception.dart';

class HttpClient extends HttpClientBase {
  final String basePath;
  final bool useHttps;

  HttpClient({@required this.basePath, @required this.useHttps});

  Future<dynamic> get({@required String path, Map<String, String> params = const {}}) async {
    var url = useHttps ? Uri.https(basePath, path, params) : Uri.http(basePath, path, params);

    var response = await http.get(url);
    var responseBody = await jsonDecode(response.body);

    if (response.statusCode != 200 || responseBody == null) {
      throw ApiException('status code: ${response.statusCode}');
    }

    return responseBody;
  }
}
