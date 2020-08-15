import 'package:wordaction/infrastructure/api/http/http_client_base.dart';
import 'package:wordaction/infrastructure/api/wp/api/wp_api_base.dart';
import 'package:wordaction/infrastructure/api/wp/models/category.dart';

class CategoryApi extends WPApiBase {
  CategoryApi(HttpClientBase http): super(http);

  Future<Category> getById(int id) async {
    var data = await http.get(path: '${WPApiBase.apiPath}/category/$id');
    return Category.fromJSON(data);
  }
}