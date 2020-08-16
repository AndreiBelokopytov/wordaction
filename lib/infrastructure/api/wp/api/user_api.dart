import 'package:wordaction/infrastructure/api/http/http_client_base.dart';
import 'package:wordaction/infrastructure/api/wp/api/wp_api_base.dart';
import 'package:wordaction/infrastructure/api/wp/models/user.dart';

class UserApi extends WPApiBase {
  UserApi(HttpClientBase http) : super(http);

  Future<User> getById(int id) async {
    var data = await http.get(path: "${WPApiBase.apiPath}/users/$id");
    return User.fromJSON(data);
  }
}
