import 'package:wordaction/infrastructure/api/http/http_client_base.dart';

class WPApiBase {
  static const apiPath = '/wp-json/wp/v2';
  final HttpClientBase _http;

  HttpClientBase get http => _http;

  WPApiBase(this._http);
}