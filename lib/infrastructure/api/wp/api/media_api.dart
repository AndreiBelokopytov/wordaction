import 'package:wordaction/infrastructure/api/http/http_client_base.dart';
import 'package:wordaction/infrastructure/api/wp/api/wp_api_base.dart';
import 'package:wordaction/infrastructure/api/wp/models/media.dart';

class MediaApi extends WPApiBase {

  MediaApi(HttpClientBase http): super(http);

  Future<Media> getById(int id) async {
    var data = await http.get(path: '${WPApiBase.apiPath}/media/$id');
    return Media.fromJSON(data);
  }
}