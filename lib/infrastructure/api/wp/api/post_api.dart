import 'package:wordaction/application/model/pagination.dart';
import 'package:wordaction/infrastructure/api/http/http_client_base.dart';
import 'package:wordaction/infrastructure/api/wp/api/wp_api_base.dart';
import 'package:wordaction/infrastructure/api/wp/models/post.dart';

class PostApi extends WPApiBase {

  PostApi(HttpClientBase http): super(http);

  Future<List<Post>> getRecent(Pagination pagination) async {
    var data = await http.get(path: '${WPApiBase.apiPath}/posts', params: {
      'page': pagination.page.toString(),
      'per_page': pagination.perPage.toString(),
      'offset': pagination.offset.toString()
    });

    return (data as List<dynamic>).map((item) => Post.fromJSON(item)).toList();
  }
}