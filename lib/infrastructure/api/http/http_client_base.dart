import 'package:flutter/foundation.dart';

abstract class HttpClientBase {
  Future<dynamic>get({@required String path, Map<String, String> params = const {}});
}