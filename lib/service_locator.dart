import 'package:get_it/get_it.dart';
import 'package:wordaction/application/bloc/recent_posts_bloc.dart';
import 'package:wordaction/infrastructure/api/http/http_client.dart';
import 'package:wordaction/infrastructure/api/http/http_client_base.dart';
import 'package:wordaction/infrastructure/api/wp/api/category_api.dart';
import 'package:wordaction/infrastructure/api/wp/api/media_api.dart';
import 'package:wordaction/infrastructure/api/wp/api/post_api.dart';
import 'package:wordaction/infrastructure/api/wp/api/user_api.dart';
import 'package:wordaction/infrastructure/repositories/post_repository_base.dart';
import 'package:wordaction/infrastructure/repositories/post_repository_wp.dart';

abstract class ServiceLocator {
  static final sl = GetIt.instance;

  static void setup() {
    sl.registerFactory<HttpClientBase>(() =>
        HttpClient(basePath: "belarus.digitallyyours.ee", useHttps: true));

    sl.registerFactory<PostRepositoryBase>(() {
      var postApi = PostApi(sl.get<HttpClientBase>());
      var categoryApi = CategoryApi(sl.get<HttpClientBase>());
      var mediaApi = MediaApi(sl.get<HttpClientBase>());
      var userApi = UserApi(sl.get<HttpClientBase>());
      return PostRepositoryWP(
          postApi: postApi,
          categoryApi: categoryApi,
          mediaApi: mediaApi,
          userApi: userApi);
    });

    sl.registerFactory<RecentPostsBloc>(
        () => RecentPostsBloc(postRepository: sl.get<PostRepositoryBase>()));
  }
}
